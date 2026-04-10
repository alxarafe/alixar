<?php

declare(strict_types=1);

namespace App\Infrastructure\Http\Api\Controller;

use App\Domain\Invoice\Invoice;
use App\Domain\Invoice\InvoiceLine;
use App\Domain\Invoice\InvoiceNotFoundException;
use App\Domain\Invoice\InvoiceRepository;
use Flight;

/**
 * InvoiceApiController — Dolibarr-compatible invoices API.
 *
 *   GET    /api/invoices        → list
 *   GET    /api/invoices/{id}   → show
 *   POST   /api/invoices        → create
 *   PUT    /api/invoices/{id}   → update
 *   DELETE /api/invoices/{id}   → delete
 *   
 *   // Endpoints específicos para líneas
 *   POST   /api/invoices/{id}/lines
 *   PUT    /api/invoices/{id}/lines/{lineId}
 *   DELETE /api/invoices/{id}/lines/{lineId}
 * 
 *   // Endpoints de ciclo de vida
 *   POST   /api/invoices/{id}/validate
 *   POST   /api/invoices/{id}/settopaid
 */
class InvoiceApiController
{
    public function __construct(
        private InvoiceRepository $repository,
    ) {}

    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.rowid';
        $sortOrder = $_GET['sortorder'] ?? 'ASC';

        $filters = [];
        if (!empty($_GET['thirdparty_ids'])) {
            $filters['thirdparty_ids'] = $_GET['thirdparty_ids'];
        }
        if (isset($_GET['status']) && $_GET['status'] !== '') {
            $filters['status'] = $_GET['status'];
        }

        $results = $this->repository->findAll($filters, $limit, $offset, $sortField, $sortOrder);

        Flight::json(array_map(fn(Invoice $i) => $i->toApiArray(), $results));
    }

    public function show(int $id): void
    {
        $invoice = $this->repository->findById($id);

        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        Flight::json($invoice->toApiArray());
    }

    public function create(): void
    {
        $data = json_decode(file_get_contents('php://input'), true) ?? [];

        if (!isset($data['socid']) && !isset($data['fk_soc'])) {
            throw new \InvalidArgumentException("El ID del tercero (socid/fk_soc) es obligatorio.");
        }

        $socId = (int) ($data['socid'] ?? $data['fk_soc']);

        $invoice = new Invoice(
            thirdPartyId: $socId,
        );

        $invoice->updateFrom($data);
        $this->repository->save($invoice);

        Flight::json($invoice->getId(), 200);
    }

    public function update(int $id): void
    {
        $invoice = $this->repository->findById($id);

        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        $data = json_decode(file_get_contents('php://input'), true) ?? [];
        $invoice->updateFrom($data);
        $this->repository->save($invoice);

        Flight::json($invoice->toApiArray());
    }

    public function destroy(int $id): void
    {
        $invoice = $this->repository->findById($id);

        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        $this->repository->delete($id);

        Flight::json([
            'success' => [
                'code' => 200,
                'message' => 'Object deleted',
            ],
        ]);
    }

    // ── Líneas ──────────────────────────────────────────

    public function postLine(int $id): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        if (!$invoice->isDraft()) {
            throw new \DomainException("No se pueden añadir líneas a una factura que no está en borrador.");
        }

        $data = json_decode(file_get_contents('php://input'), true) ?? [];
        
        $line = new InvoiceLine(
            invoiceId: $id,
            qty: (float) ($data['qty'] ?? 1),
            subprice: (float) ($data['subprice'] ?? 0),
            vatRate: (float) ($data['tva_tx'] ?? 21.0),
            description: $data['desc'] ?? $data['description'] ?? null,
            label: $data['label'] ?? null,
            productId: isset($data['fk_product']) && $data['fk_product'] ? (int) $data['fk_product'] : null,
            discountPercent: (float) ($data['remise_percent'] ?? 0),
        );

        $this->repository->saveLine($line);
        // Automáticamente el repositorio recalcula los totales de la cabecera
        $this->repository->updateTotals($id);

        Flight::json($line->getId(), 200);
    }

    // ── Acciones de Ciclo de Vida ───────────────────────

    public function validate(int $id): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        // Dolibarr genera aquí la ref (ej: FA2604-001). Simulemos algo por ahora.
        $newRef = 'FA' . date('ym') . '-' . str_pad((string)$id, 3, '0', STR_PAD_LEFT);
        
        $invoice->validate($newRef);
        $this->repository->save($invoice);

        Flight::json($invoice->toApiArray());
    }

    public function setPaid(int $id): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        $invoice->setPaid();
        $this->repository->save($invoice);

        Flight::json($invoice->toApiArray());
    }
}
