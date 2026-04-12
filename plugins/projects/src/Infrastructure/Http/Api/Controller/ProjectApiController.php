<?php

declare(strict_types=1);

namespace Plugin\Projects\Infrastructure\Http\Api\Controller;

use Plugin\Projects\Domain\Project\Project;
use Plugin\Projects\Domain\Project\ProjectRepository;
use Core\Infrastructure\DolibarrMappingTrait;
use Flight;

class ProjectApiController
{
    use DolibarrMappingTrait;

    private const API_MAP = [
        'id' => 'id',
        'thirdPartyId' => 'socid',
        'ref' => 'ref',
        'refExt' => 'ref_ext',
        'title' => 'title',
        'status' => 'statut',
    ];

    public function __construct(
        private ProjectRepository $repository,
    ) {
    }

    /**
     * @return array<string, mixed>
     */
    private function mapResponse(Project $project): array
    {
        $payload = $project->toArray();
        if (isset($payload['createdAt'])) $payload['date_creation'] = strtotime($payload['createdAt']);
        if (isset($payload['updatedAt'])) $payload['date_modification'] = strtotime($payload['updatedAt']);
        if (isset($payload['dateStartEvent'])) $payload['date_start_event'] = strtotime($payload['dateStartEvent']);
        if (isset($payload['dateEndEvent'])) $payload['date_end_event'] = strtotime($payload['dateEndEvent']);
        
        return $this->mapToDolibarr($payload, self::API_MAP);
    }

    public function list(): void
    {
        $limit = (int) ($_GET['limit'] ?? 100);
        $page = (int) ($_GET['page'] ?? 0);
        $offset = $page * $limit;
        $sortField = $_GET['sortfield'] ?? 't.rowid';
        $sortOrder = $_GET['sortorder'] ?? 'ASC';

        $sortField = str_replace('t.', '', $sortField);

        $projects = $this->repository->findAll($limit, $offset, $sortField, $sortOrder);

        $response = array_map(function (Project $project) {
            return $this->mapResponse($project);
        }, $projects);

        Flight::json($response, 200);
    }

    public function show(int $id): void
    {
        $project = $this->repository->findById($id);

        if (!$project) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }

        $response = $this->mapResponse($project);
        $response['tasks'] = $this->repository->getTasks($id);

        Flight::json($response, 200);
    }

    public function getByRef(string $ref): void
    {
        $project = $this->repository->findByRef($ref);
        if (!$project) {
            Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
            return;
        }
        $response = $this->mapResponse($project);
        $response['tasks'] = $this->repository->getTasks($project->getId() ?? 0);
        Flight::json($response, 200);
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

            $project = Project::fromArray($cleanData);
            $this->repository->save($project);

            Flight::json($project->getId(), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function update(int $id): void
    {
        try {
            $project = $this->repository->findById($id);
            if (!$project) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $cleanData = $this->mapToClean($payload, self::API_MAP);

            $project->updateFrom($cleanData);
            $this->repository->save($project);

            $updatedProject = $this->repository->findById($id);
            if (!$updatedProject) {
                Flight::json(['error' => ['code' => 500, 'message' => 'Failed to fetch updated project']], 500);
                return;
            }
            Flight::json($this->mapResponse($updatedProject), 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function destroy(int $id): void
    {
        try {
            $project = $this->repository->findById($id);
            if (!$project) {
                Flight::json(['error' => ['code' => 404, 'message' => 'Not Found']], 404);
                return;
            }

            $this->repository->delete($id);
            Flight::json(['success' => ['code' => 200, 'message' => 'Deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- Tasks ---
    public function getTasks(int $id): void
    {
        Flight::json($this->repository->getTasks($id), 200);
    }

    public function postTask(int $id): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->addTask($id, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Task added']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function putTask(int $id, int $taskId): void
    {
        try {
            $payload = json_decode((string) file_get_contents('php://input'), true) ?? [];
            $this->repository->updateTask($id, $taskId, $payload);
            Flight::json(['success' => ['code' => 200, 'message' => 'Task updated']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function deleteTask(int $id, int $taskId): void
    {
        try {
            $this->repository->deleteTask($id, $taskId);
            Flight::json(['success' => ['code' => 200, 'message' => 'Task deleted']], 200);
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    // --- State Flow ---
    public function validate(int $id): void
    {
        try {
            $project = $this->repository->findById($id);
            if ($project) {
                // Status 1 = Validated/Opened
                $project->updateFrom(['status' => 1]);
                $this->repository->save($project);
                Flight::json(['success' => ['code' => 200, 'message' => 'Validated']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }

    public function close(int $id): void
    {
        try {
            $project = $this->repository->findById($id);
            if ($project) {
                // Status 2 = Closed
                $project->updateFrom(['status' => 2]);
                $this->repository->save($project);
                Flight::json(['success' => ['code' => 200, 'message' => 'Closed']], 200);
            }
        } catch (\Throwable $e) {
            Flight::json(['error' => ['code' => 500, 'message' => $e->getMessage()]], 500);
        }
    }
}
