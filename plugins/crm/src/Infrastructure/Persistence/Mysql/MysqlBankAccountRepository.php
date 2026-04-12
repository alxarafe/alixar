<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql;

use Plugin\Crm\Domain\ThirdParty\BankAccount;
use Plugin\Crm\Domain\ThirdParty\BankAccountRepository;
use Core\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlBankAccountRepository implements BankAccountRepository
{
    use DolibarrMappingTrait;

    public const COLUMN_MAP = [
        'id' => 'rowid',
        'thirdPartyId' => 'fk_soc',
        'bank' => 'bank',
        'bankCode' => 'code_banque',
        'deskCode' => 'code_guichet',
        'number' => 'number',
        'ribKey' => 'cle_rib',
        'bic' => 'bic',
        'iban' => 'iban_prefix',
        'ownerName' => 'proprio',
        'ownerAddress' => 'owner_address',
        'label' => 'label',
        'isDefault' => 'default_rib',
    ];

    private string $table;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = ''
    ) {
        $this->table = $tablePrefix . 'societe_rib';
    }

    #[\Override]
    public function findById(int $id): ?BankAccount
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE rowid = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        $cleanData = $this->mapToClean($row, self::COLUMN_MAP);
        return $this->hydrate($cleanData);
    }

    #[\Override]
    public function findByThirdPartyId(int $thirdPartyId): array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE fk_soc = :socid');
        $stmt->execute(['socid' => $thirdPartyId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return array_map(function ($row) {
            $cleanData = $this->mapToClean($row, self::COLUMN_MAP);
            return $this->hydrate($cleanData);
        }, $rows);
    }

    #[\Override]
    public function save(BankAccount $account): void
    {
        $data = $account->toArray();
        $dbData = $this->mapToDolibarr($data, self::COLUMN_MAP);

        if ($account->getId() === null) {
            unset($dbData['rowid']);
            $dbData['datec'] = date('Y-m-d H:i:s');
            // 'type' is usually 'ban' for bank accounts
            $dbData['type'] = 'ban';

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf(
                'INSERT INTO %s (%s) VALUES (%s)',
                $this->table,
                implode(', ', $columns),
                implode(', ', $placeholders)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            $account->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $dbData['rowid'];
            unset($dbData['rowid']);

            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf(
                'UPDATE %s SET %s WHERE rowid = :id',
                $this->table,
                implode(', ', $sets)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE rowid = :id');
        $stmt->execute(['id' => $id]);
    }

    private function hydrate(array $data): BankAccount
    {
        $account = new BankAccount(
            thirdPartyId: (int) $data['thirdPartyId'],
        );
        $account->updateFrom($data);
        if (isset($data['id'])) {
            $account->setId((int) $data['id']);
        }
        return $account;
    }
}
