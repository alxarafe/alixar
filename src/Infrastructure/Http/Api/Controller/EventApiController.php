<?php

declare(strict_types=1);

namespace App\Infrastructure\Http\Api\Controller;

use App\Domain\Event\Event;
use App\Domain\Event\EventRepository;
use App\Infrastructure\DolibarrMappingTrait;
use Flight;

class EventApiController
{
    use DolibarrMappingTrait;

    private const API_MAP = [
        'id' => 'id',
        'ref' => 'ref',
        'title' => 'title',
        'typeCode' => 'typeCode',
        'dateStart' => 'dateStart',
        'dateEnd' => 'dateEnd',
        'percentage' => 'percentage',
        'note' => 'note',
        'thirdPartyId' => 'thirdPartyId',
        'contactId' => 'contactId',
        'projectId' => 'projectId',
        'assignedUserId' => 'assignedUserId',
        'authorUserId' => 'authorUserId'
    ];

    public function __construct(
        private EventRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(Event $event): array
    {
        $payload = $event->toArray();
        if (isset($payload['createdAt'])) $payload['date_creation'] = strtotime($payload['createdAt']);
        if (isset($payload['updatedAt'])) $payload['date_modification'] = strtotime($payload['updatedAt']);
        
        return $this->mapToDolibarr($payload, self::API_MAP);
    }

    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.datep';
        $sortOrder = $_GET['sortorder'] ?? 'DESC';

        $sortField = str_replace('t.', '', $sortField);

        $events = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (Event $event) {
            return $this->mapResponse($event);
        }, $events);

        Flight::json($response, 200);
    }

    public function show(int $id): void
    {
        $event = $this->repository->findById($id);

        if (!$event) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        Flight::json($this->mapResponse($event), 200);
    }

    public function create(): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            if (empty($cleanData['title'])) {
                Flight::json(['error' => ['code' => 400, 'message' => 'title is required']], 400);
                return;
            }

            $event = Event::fromArray($cleanData);
            $this->repository->save($event);

            Flight::json($event->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $event = $this->repository->findById($id);
            if (!$event) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $event->updateFrom($cleanData);
            $this->repository->save($event);

            $updatedEvent = $this->repository->findById($id);
            if (!$updatedEvent) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to fetch updated event']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedEvent), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function destroy(int $id): void
    {
        try {
            $event = $this->repository->findById($id);
            if (!$event) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $this->repository->delete($id);
            Flight::json(['success' => ['code' => 200, 'message' => 'Deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
