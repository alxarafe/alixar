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
    use \App\Infrastructure\DolibarrMappingTrait;

    private const API_MAP = [
        'thirdPartyId' => 'socid',
        'date' => 'datef',
        'dateDue' => 'date_lim_reglement',
        'status' => 'fk_statut',
        'paymentTerms' => 'fk_cond_reglement',
        'paymentMode' => 'fk_mode_reglement',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'isPaid' => 'paye',
        'totalHt' => 'total_ht',
        'totalVat' => 'total_tva',
        'totalTtc' => 'total_ttc',
    ];

    private const API_LINE_MAP = [
        'productId' => 'fk_product',
        'vatRate' => 'tva_tx',
        'discountPercent' => 'remise_percent',
        'totalHt' => 'total_ht',
        'totalVat' => 'total_tva',
        'totalTtc' => 'total_ttc',
        'invoiceId' => 'fk_facture',
        'description' => 'desc',
    ];

    public function __construct(
        private InvoiceRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(Invoice $invoice): array
    {
        $payload = $invoice->toArray();
        if (isset($payload['date'])) $payload['date'] = strtotime($payload['date']);
        if (isset($payload['dateDue'])) $payload['dateDue'] = strtotime($payload['dateDue']);
        if (isset($payload['createdAt'])) $payload['date_creation'] = strtotime($payload['createdAt']); // Dolibarr returns date_creation
        
        $data = $this->mapToDolibarr($payload, self::API_MAP);
        
        // Map lines as well
        $data['lines'] = array_map(function (InvoiceLine $line) {
            return $this->mapToDolibarr($line->toArray(), self::API_LINE_MAP);
        }, $invoice->getLines());

        return $data;
    }

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

        Flight::json(array_map(fn(Invoice $i) => $this->mapResponse($i), $results));
    }

    public function show(int $id): void
    {
        $invoice = $this->repository->findById($id);

        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        Flight::json($this->mapResponse($invoice));
    }

    public function create(): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            if (isset($payload['fk_soc']) && !isset($payload['socid'])) {
                $payload['socid'] = $payload['fk_soc'];
            }
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            if (empty($cleanData['thirdPartyId'])) {
                throw new \InvalidArgumentException("El ID del tercero (socid/fk_soc) es obligatorio.");
            }

            $invoice = new Invoice(
                thirdPartyId: (int) $cleanData['thirdPartyId'],
            );

            $invoice->updateFrom($cleanData);
            $this->repository->save($invoice);

            Flight::json($invoice->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage(), 'trace' => $e->getTraceAsString()]], 500);
        }
    }

    public function update(int $id): void
    {
        $invoice = $this->repository->findById($id);

        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        if (isset($payload['fk_soc']) && !isset($payload['socid'])) {
            $payload['socid'] = $payload['fk_soc'];
        }
        $cleanData = $this->mapToClean($payload, self::API_MAP);
        
        $invoice->updateFrom($cleanData);
        $this->repository->save($invoice);

        Flight::json($this->mapResponse($invoice));
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

    public function getByRef(string $ref): void
    {
        $invoice = $this->repository->findByRef($ref);
        if ($invoice === null) {
            throw new InvoiceNotFoundException("Invoice with ref {$ref} not found", 404);
        }
        Flight::json($this->mapResponse($invoice));
    }

    public function getByRefExt(string $refExt): void
    {
        $invoice = $this->repository->findByRefExt($refExt);
        if ($invoice === null) {
            throw new InvoiceNotFoundException("Invoice with ref_ext {$refExt} not found", 404);
        }
        Flight::json($this->mapResponse($invoice));
    }

    // ── Líneas ──────────────────────────────────────────

    public function getLines(int $id): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        $lines = array_map(function (InvoiceLine $line) {
            return $this->mapToDolibarr($line->toArray(), self::API_LINE_MAP);
        }, $invoice->getLines());

        Flight::json($lines);
    }

    public function postLine(int $id): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        if (!$invoice->isDraft()) {
            throw new \DomainException("No se pueden añadir líneas a una factura que no está en borrador.");
        }

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        if (isset($payload['description']) && !isset($payload['desc'])) {
            $payload['desc'] = $payload['description'];
        }
        $cleanData = $this->mapToClean($payload, self::API_LINE_MAP);

        $line = new InvoiceLine(
            invoiceId: $id,
            qty: (float) ($cleanData['qty'] ?? 1),
            subprice: (float) ($cleanData['subprice'] ?? 0),
            vatRate: (float) ($cleanData['vatRate'] ?? 21.0),
            description: $cleanData['description'] ?? null,
            label: $cleanData['label'] ?? null,
            productId: isset($cleanData['productId']) && $cleanData['productId'] ? (int) $cleanData['productId'] : null,
            discountPercent: (float) ($cleanData['discountPercent'] ?? 0),
        );

        $this->repository->saveLine($line);
        // Automáticamente el repositorio recalcula los totales de la cabecera
        $this->repository->updateTotals($id);

        Flight::json($line->getId(), 200);
    }

    public function putLine(int $id, int $lineId): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) throw InvoiceNotFoundException::withId($id);
        if (!$invoice->isDraft()) throw new \DomainException("No se pueden modificar líneas de una factura validada.");

        $line = $this->repository->findLineById($lineId);
        if ($line === null || $line->getInvoiceId() !== $id) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Line not found']], 404);
            return;
        }

        $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
        if (isset($payload['description']) && !isset($payload['desc'])) {
            $payload['desc'] = $payload['description'];
        }
        $cleanData = $this->mapToClean($payload, self::API_LINE_MAP);

        $line->updateFrom($cleanData);
        $this->repository->saveLine($line);
        $this->repository->updateTotals($id);

        $updatedInvoice = $this->repository->findById($id);
        if ($updatedInvoice === null) throw InvoiceNotFoundException::withId($id);
        Flight::json($this->mapResponse($updatedInvoice));
    }

    public function deleteLine(int $id, int $lineId): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) throw InvoiceNotFoundException::withId($id);
        if (!$invoice->isDraft()) throw new \DomainException("No se pueden borrar líneas de una factura validada.");

        $this->repository->deleteLine($lineId);
        $this->repository->updateTotals($id);

        $updatedInvoice = $this->repository->findById($id);
        if ($updatedInvoice === null) throw InvoiceNotFoundException::withId($id);
        Flight::json($this->mapResponse($updatedInvoice));
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

        Flight::json($this->mapResponse($invoice));
    }

    public function setPaid(int $id): void
    {
        $invoice = $this->repository->findById($id);
        if ($invoice === null) {
            throw InvoiceNotFoundException::withId($id);
        }

        $invoice->setPaid();
        $this->repository->save($invoice);

        Flight::json($this->mapResponse($invoice));
    }

    // ── Relaciones Externas (Stubs) ─────────────────────

    public function createInvoiceFromOrder(int $orderid): void
    {
        Flight::json(['error' => ['code' => 501, 'message' => 'Not Implemented']], 501);
    }

    public function createInvoiceFromContract(int $contractid): void
    {
        Flight::json(['error' => ['code' => 501, 'message' => 'Not Implemented']], 501);
    }

    public function getContacts(int $id): void
    {
        Flight::json(['error' => ['code' => 501, 'message' => 'Not Implemented']], 501);
    }

    public function postContact(int $id, int $contactid, string $type): void
    {
        Flight::json(['error' => ['code' => 501, 'message' => 'Not Implemented']], 501);
    }

    public function deleteContact(int $id, int $contactid, string $type): void
    {
        Flight::json(['error' => ['code' => 501, 'message' => 'Not Implemented']], 501);
    }
}
