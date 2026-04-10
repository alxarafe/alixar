<?php

namespace Modules\CRM\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Date;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\Select;
use Alxarafe\Component\Container\Panel;
use Modules\CRM\Domain\Model\Contact;
use Modules\CRM\Domain\Port\Driven\ContactRepositoryInterface;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;
use Modules\CRM\Application\AppContainer;
use Alxarafe\Application\Bus\SimpleCommandBus;
use Modules\CRM\Application\Bus\Command\CreateContactCommand;
use Modules\CRM\Application\Bus\Command\UpdateContactCommand;

/**
 * Class ContactController
 * Manages Contacts / Addresses (socpeople).
 *
 * Dolibarr equivalent: htdocs/contact/card.php, htdocs/contact/list.php
 *
 * @package Modules\CRM\Controller
 */
#[Menu(
    menu: 'main_menu',
    label: 'Contactos',
    icon: 'fas fa-users',
    parent: ThirdPartyController::class,
    order: 20,
    permission: 'Alixar.Contact.doIndex'
)]
class ContactController extends ResourceController
{
    const MENU = 'CRM|Contactos';
    const SIDEBAR_MENU = [
        ['option' => 'Listado Contactos'],
        ['option' => 'Nuevo Contacto'],
    ];

    protected bool $useTabs = true;

    private ContactRepositoryInterface $repository;
    private ThirdPartyRepositoryInterface $thirdPartyRepo;
    private SimpleCommandBus $commandBus;

    public function __construct()
    {
        parent::__construct();
        $this->repository = AppContainer::get()->get(ContactRepositoryInterface::class);
        $this->thirdPartyRepo = AppContainer::get()->get(ThirdPartyRepositoryInterface::class);
        $this->commandBus = AppContainer::get()->get(SimpleCommandBus::class);
    }

    #[\Override]
    protected function getModelClass(): string
    {
        return Contact::class;
    }

    // OVERRIDE: Prevent Eloquent grid listing
    #[\Override]
    protected function fetchListData(string $tabId): array
    {
        $filters = [];
        $limit = $this->structConfig['list']['limit'] ?? 50;
        
        $contacts = $this->repository->findAll($filters, $limit, $this->offset);
        $total = $this->repository->count($filters);
        
        $data = [];
        foreach ($contacts as $contact) {
            $row = $contact->toArray();
            if ($contact->getThirdPartyId()) {
                $tp = $this->thirdPartyRepo->findById($contact->getThirdPartyId());
                if ($tp) {
                    $row['thirdParty.nom'] = $tp->getName();
                }
            }
            $data[] = $row;
        }

        return [
            'data' => $data,
            'meta' => [
                'total' => $total,
                'limit' => $limit,
                'offset' => $this->offset,
            ]
        ];
    }
    
    // OVERRIDE: Prevent Eloquent fetching
    #[\Override]
    protected function fetchRecordData(): array
    {
        if ($this->recordId === 'new') {
            return [
                'id' => 'new',
                'data' => [],
                'meta' => [
                    'model' => Contact::class,
                    'is_new' => true
                ]
            ];
        }

        $contact = $this->repository->findById((int) $this->recordId);
        if (!$contact) {
            return ['error' => 'Record not found'];
        }

        return [
            'id' => $this->recordId,
            'data' => $contact->toArray(),
            'meta' => [
                'model' => Contact::class
            ]
        ];
    }

    // OVERRIDE: Prevent Eloquent saves
    #[\Override]
    protected function saveRecord()
    {
        $data = $_POST['data'] ?? [];

        if (!empty($this->recordId) && $this->recordId !== 'new') {
            $cmd = new UpdateContactCommand(
                id: (int) $this->recordId,
                lastname: $data['lastname'] ?? null,
                firstname: $data['firstname'] ?? null,
                thirdPartyId: isset($data['fk_soc']) ? (int) $data['fk_soc'] : null,
                civility: $data['civility'] ?? null,
                position: $data['poste'] ?? null,
                phone: $data['phone'] ?? null,
                phonePersonal: $data['phone_perso'] ?? null,
                phoneMobile: $data['phone_mobile'] ?? null,
                fax: $data['fax'] ?? null,
                email: $data['email'] ?? null,
                url: $data['url'] ?? null,
                address: $data['address'] ?? null,
                zip: $data['zip'] ?? null,
                town: $data['town'] ?? null,
                stateId: isset($data['fk_departement']) ? (int) $data['fk_departement'] : null,
                countryId: isset($data['fk_pays']) ? (int) $data['fk_pays'] : null,
                notePrivate: $data['note_private'] ?? null,
                notePublic: $data['note_public'] ?? null
            );
            $this->commandBus->dispatch($cmd);
            \Alxarafe\Infrastructure\Lib\Messages::addMessage('Contacto modificado con éxito.');
            $id = $this->recordId;
        } else {
            $cmd = new CreateContactCommand(
                lastname: $data['lastname'] ?? 'Sin apellido',
                firstname: $data['firstname'] ?? null,
                thirdPartyId: isset($data['fk_soc']) ? (int) $data['fk_soc'] : null,
                civility: $data['civility'] ?? null,
                position: $data['poste'] ?? null,
                phone: $data['phone'] ?? null,
                phonePersonal: $data['phone_perso'] ?? null,
                phoneMobile: $data['phone_mobile'] ?? null,
                fax: $data['fax'] ?? null,
                email: $data['email'] ?? null,
                url: $data['url'] ?? null,
                address: $data['address'] ?? null,
                zip: $data['zip'] ?? null,
                town: $data['town'] ?? null,
                stateId: isset($data['fk_departement']) ? (int) $data['fk_departement'] : null,
                countryId: isset($data['fk_pays']) ? (int) $data['fk_pays'] : null,
                notePrivate: $data['note_private'] ?? null,
                notePublic: $data['note_public'] ?? null
            );
            $id = $this->commandBus->dispatch($cmd);
            \Alxarafe\Infrastructure\Lib\Messages::addMessage('Contacto creado con éxito.');
        }

        if (isset($_GET['ajax']) && str_starts_with($_GET['ajax'], 'save_record')) {
            $this->jsonResponse([
                'status' => 'success',
                'id' => $id,
                'data' => $data,
                'messages' => \Alxarafe\Infrastructure\Lib\Messages::getMessages(),
            ]);
            exit;
        }

        header('Location: ' . static::url() . '&id=' . $id);
        exit;
    }
    
    // OVERRIDE: Handle Deletion
    #[\Override]
    public function doDelete(): bool
    {
        if ($this->recordId && $this->recordId !== 'new') {
            $this->repository->delete((int) $this->recordId);
            \Alxarafe\Infrastructure\Lib\Messages::addMessage('Contacto borrado con éxito.');
        }
        
        header('Location: ' . static::url());
        exit;
        return true;
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Listado Contactos',
        icon: 'fas fa-list',
        parent: ContactController::class,
        order: 1,
        permission: 'Alixar.Contact.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[\Override]
    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Contacto',
        icon: 'fas fa-plus',
        parent: ContactController::class,
        order: 2,
        permission: 'Alixar.Contact.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    #[\Override]
    protected function getListColumns(): array
    {
        return [
            new Text('lastname', 'Apellidos'),
            new Text('firstname', 'Nombre'),
            new Text('thirdParty.nom', 'Tercero'),
            new Text('poste', 'Cargo'),
            new Text('town', 'Ciudad'),
            new Text('phone', 'Teléfono'),
            new Text('email', 'Email'),
        ];
    }

    #[\Override]
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Ficha',
                'fields' => [
                    new Panel('Identidad', [
                        new Text('civility', 'Tratamiento', ['col' => 'col-md-2']),
                        new Text('lastname', 'Apellidos', ['required' => true, 'col' => 'col-md-5']),
                        new Text('firstname', 'Nombre', ['col' => 'col-md-5']),
                        new Select('fk_soc', 'Tercero', [
                            'model' => \Modules\Alixar\Model\ThirdParty::class,
                            'label_field' => 'nom',
                            'col' => 'col-md-6'
                        ]),
                        new Text('poste', 'Cargo / Función', ['col' => 'col-md-6']),
                    ]),
                    new Panel('Contacto', [
                        new Text('phone', 'Teléfono', ['col' => 'col-md-4']),
                        new Text('phone_perso', 'Tel. Personal', ['col' => 'col-md-4']),
                        new Text('phone_mobile', 'Móvil', ['col' => 'col-md-4']),
                        new Text('email', 'Email', ['col' => 'col-md-6']),
                        new Text('url', 'Web', ['col' => 'col-md-6']),
                    ]),
                ]
            ],
            'address' => [
                'label' => 'Dirección',
                'fields' => [
                    new Panel('Dirección', [
                        new Text('address', 'Dirección'),
                        new Text('zip', 'CP', ['col' => 'col-md-3']),
                        new Text('town', 'Ciudad', ['col' => 'col-md-3']),
                        new Text('fk_departement', 'Provincia', ['col' => 'col-md-3']),
                        new Text('fk_pays', 'País', ['col' => 'col-md-3']),
                    ]),
                    new Panel('Datos Personales', [
                        new Date('birthday', 'Fecha Nacimiento'),
                    ]),
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Panel('Notas', [
                        new Textarea('note_private', 'Nota Privada'),
                        new Textarea('note_public', 'Nota Pública'),
                    ]),
                ]
            ],
        ];
    }

    #[\Override]
    protected function beforeConfig()
    {
        if ($this->recordId && $this->recordId !== 'new') {
            $record = $this->repository->findById((int) $this->recordId);
            $name = $record ? trim(($record->getFirstname() ?? '') . ' ' . $record->getLastname()) : '';
            $this->addVariable('title', $name ?: 'Contacto');
        } else {
            $this->addVariable('title', 'Nuevo Contacto');
        }
    }
}
