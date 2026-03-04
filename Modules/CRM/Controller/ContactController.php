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
use Modules\Alixar\Model\Contact;

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
    protected bool $useTabs = true;

    protected function getModelClass(): string
    {
        return Contact::class;
    }

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

    /**
     * Eager load the thirdParty relation for the list view.
     */
    protected array $eagerLoad = ['thirdParty'];

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

    protected function beforeConfig()
    {
        if ($this->recordId && $this->recordId !== 'new') {
            $record = $this->getRecord();
            $name = trim(($record->firstname ?? '') . ' ' . ($record->lastname ?? ''));
            $this->addVariable('title', $name ?: 'Contacto');
        } else {
            $this->addVariable('title', 'Nuevo Contacto');
        }
    }
}
