<?php

namespace Modules\CRM\Controller;

use Alxarafe\Base\Controller\ApiController;
use Modules\CRM\Application\AppContainer;
use Modules\CRM\Application\Bus\Command\CreateThirdPartyCommand;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;
use Alxarafe\Application\Bus\SimpleCommandBus;

/**
 * Class ThirdPartyApiController
 * API Endpoint for managing Third Parties.
 *
 * Refactored to use hexagonal architecture:
 *   - Reads go through ThirdPartyRepositoryInterface (driven port)
 *   - Writes go through CommandBus → Handler → Repository
 *
 * @package Modules\CRM\Controller
 */
class ThirdPartyApiController extends ApiController
{
    private ThirdPartyRepositoryInterface $thirdPartyRepo;
    private SimpleCommandBus $commandBus;

    public function __construct(?string $action = null, mixed $data = null)
    {
        parent::__construct($action, $data);

        $container = AppContainer::get();
        $this->thirdPartyRepo = $container->get(ThirdPartyRepositoryInterface::class);
        $this->commandBus = $container->get(SimpleCommandBus::class);
    }

    /**
     * Lists all third parties via hexagonal repository.
     * Endpoint: api.php/CRM/ThirdPartyApi/list
     */
    public function doList()
    {
        if (!static::$user || !static::$user->can('lire', '', 'societe')) {
            static::badApiCall('Permission denied: societe.lire required', 403);
        }

        $limit = (int) ($_REQUEST['limit'] ?? 20);
        $offset = (int) ($_REQUEST['offset'] ?? 0);

        // Build filters from query params
        $filters = [];
        if (isset($_REQUEST['client'])) {
            $filters['client'] = (int) $_REQUEST['client'];
        }
        if (isset($_REQUEST['fournisseur'])) {
            $filters['fournisseur'] = (int) $_REQUEST['fournisseur'];
        }

        $total = $this->thirdPartyRepo->count($filters);
        $thirdParties = $this->thirdPartyRepo->findAll($filters, $limit, $offset);

        // Convert domain entities to arrays for JSON response
        $items = array_map(fn($tp) => $tp->toArray(), $thirdParties);

        static::jsonResponse([
            'total' => $total,
            'limit' => $limit,
            'offset' => $offset,
            'items' => $items,
        ]);
    }

    /**
     * Gets a single third party via hexagonal repository.
     * Endpoint: api.php/CRM/ThirdPartyApi/get/{id}
     */
    public function doGet($id = null)
    {
        if (!static::$user || !static::$user->can('lire', '', 'societe')) {
            static::badApiCall('Permission denied: societe.lire required', 403);
        }

        $id = $id ?? $_REQUEST['id'] ?? null;

        if (!$id) {
            static::badApiCall('Missing ID', 400);
        }

        $thirdParty = $this->thirdPartyRepo->findById((int) $id);

        if (!$thirdParty) {
            static::badApiCall('Third party not found', 404);
        }

        static::jsonResponse($thirdParty->toArray());
    }

    /**
     * Creates a third party via command bus.
     * Endpoint: api.php/CRM/ThirdPartyApi/save
     */
    public function doSave()
    {
        if (!static::$user || !static::$user->can('creer', '', 'societe')) {
            static::badApiCall('Permission denied: societe.creer required', 403);
        }

        $data = json_decode(file_get_contents('php://input'), true) ?? $_POST;

        if (empty($data['nom'] ?? $data['name'] ?? '')) {
            static::badApiCall('Field "name" is required', 400);
        }

        $command = new CreateThirdPartyCommand(
            name: $data['nom'] ?? $data['name'],
            type: (int) ($data['client'] ?? $data['type'] ?? 0),
            isSupplier: (bool) ($data['fournisseur'] ?? $data['is_supplier'] ?? false),
            nameAlias: $data['name_alias'] ?? null,
            address: $data['address'] ?? null,
            zip: $data['zip'] ?? null,
            town: $data['town'] ?? null,
            phone: $data['phone'] ?? null,
            email: $data['email'] ?? null,
        );

        try {
            $id = $this->commandBus->dispatch($command);
            static::jsonResponse([
                'status' => 'success',
                'id' => $id,
                'message' => 'Tercero creado correctamente.',
            ]);
        } catch (\Throwable $e) {
            static::badApiCall($e->getMessage(), 500);
        }
    }
}

