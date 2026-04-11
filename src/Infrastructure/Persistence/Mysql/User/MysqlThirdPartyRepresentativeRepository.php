<?php

declare(strict_types=1);

namespace App\Infrastructure\Persistence\Mysql\User;

use App\Domain\User\User;
use App\Domain\User\ThirdPartyRepresentativeRepository;
use App\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlThirdPartyRepresentativeRepository implements ThirdPartyRepresentativeRepository
{
    use DolibarrMappingTrait;

    private string $tableUser;
    private string $tableLink;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = ''
    ) {
        $this->tableUser = $tablePrefix . 'user';
        $this->tableLink = $tablePrefix . 'societe_commerciaux';
    }

    public function findByThirdPartyId(int $thirdPartyId): array
    {
        $sql = "SELECT u.rowid, u.login, u.email, u.firstname, u.lastname
                FROM {$this->tableUser} u
                INNER JOIN {$this->tableLink} sc ON u.rowid = sc.fk_user
                WHERE sc.fk_soc = :socid";
                
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['socid' => $thirdPartyId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $users = [];
        foreach ($rows as $row) {
            $users[] = new User(
                id: (int) $row['rowid'],
                login: $row['login'],
                email: $row['email'],
                firstname: $row['firstname'],
                lastname: $row['lastname']
            );
        }
        
        return $users;
    }

    public function linkRepresentative(int $thirdPartyId, int $userId): void
    {
        // Insert ignore basically
        $sql = "INSERT INTO {$this->tableLink} (fk_soc, fk_user) 
                VALUES (:socid, :userid) 
                ON DUPLICATE KEY UPDATE fk_user = fk_user";
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['userid' => $userId, 'socid' => $thirdPartyId]);
    }

    public function unlinkRepresentative(int $thirdPartyId, int $userId): void
    {
        $sql = "DELETE FROM {$this->tableLink} WHERE fk_user = :userid AND fk_soc = :socid";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['userid' => $userId, 'socid' => $thirdPartyId]);
    }
}
