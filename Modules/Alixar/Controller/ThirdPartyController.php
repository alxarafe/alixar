<?php

namespace Modules\Alixar\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Modules\Alixar\Model\ThirdParty;

/**
 * Class ThirdPartyController
 * Manages Third Parties (Customers and Suppliers).
 *
 * @package Modules\Alixar\Controller
 */
class ThirdPartyController extends ResourceController
{
    /**
     * Define the primary model class for this controller.
     *
     * @return string
     */
    protected function getModelClass(): string
    {
        return ThirdParty::class;
    }

    /**
     * Define columns for the list view.
     *
     * @return array
     */
    protected function getListColumns(): array
    {
        return [
            new Text('nom', 'Nombre'),
            new Text('code_client', 'Cód. Cliente'),
            new Text('town', 'Ciudad'),
            new Text('phone', 'Teléfono'),
            new Text('email', 'Email'),
            new Boolean('client', 'Cliente'),
            new Boolean('fournisseur', 'Proveedor'),
        ];
    }

    /**
     * Define fields for the edit form.
     *
     * @return array
     */
    protected function getEditFields(): array
    {
        return [
            'main' => [
                'label' => 'Información General',
                'fields' => [
                    new Text('nom', 'Razón Social', ['required' => true]),
                    new Text('name_alias', 'Nombre Comercial'),
                    new Text('code_client', 'Código Cliente'),
                    new Text('code_fournisseur', 'Código Proveedor'),
                    new Text('tva_intra', 'CIF/NIF'),
                ]
            ],
            'contact' => [
                'label' => 'Contacto y Dirección',
                'fields' => [
                    new Text('address', 'Dirección'),
                    new Text('zip', 'CP'),
                    new Text('town', 'Ciudad'),
                    new Text('phone', 'Teléfono'),
                    new Text('phone_mobile', 'Móvil'),
                    new Text('email', 'Email'),
                    new Text('url', 'Sitio Web'),
                ]
            ],
            'notes' => [
                'label' => 'Notas',
                'fields' => [
                    new Textarea('note_public', 'Nota Pública'),
                    new Textarea('note_private', 'Nota Privada'),
                ]
            ]
        ];
    }

    /**
     * Hook called before building configuration.
     * Useful for setting page title.
     */
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Gestión de Terceros - Alixar');
    }
}
