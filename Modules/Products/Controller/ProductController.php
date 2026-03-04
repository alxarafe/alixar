<?php

namespace Modules\Products\Controller;

use Alxarafe\Base\Controller\ResourceController;
use Alxarafe\Attribute\Menu;
use Alxarafe\Component\Fields\Text;
use Alxarafe\Component\Fields\Decimal;
use Alxarafe\Component\Fields\Integer;
use Alxarafe\Component\Fields\Boolean;
use Alxarafe\Component\Fields\Textarea;
use Alxarafe\Component\Fields\Select;
use Modules\Alixar\Model\Product;

/**
 * Class ProductController
 * Manages Products and Services.
 *
 * @package Modules\Products\Controller
 */
#[Menu(
    menu: 'top_menu',
    label: 'Productos',
    icon: 'fas fa-boxes',
    order: 40,
    permission: 'Alixar.Product.doIndex'
)]
class ProductController extends ResourceController
{
    protected bool $useTabs = true;

    #[Menu(
        menu: 'main_menu',
        label: 'Listado Productos',
        icon: 'fas fa-list',
        parent: ProductController::class,
        order: 1,
        permission: 'Alixar.Product.doIndex'
    )]
    public function doIndex(): bool
    {
        return parent::doIndex();
    }

    #[Menu(
        menu: 'main_menu',
        label: 'Nuevo Producto',
        icon: 'fas fa-plus',
        parent: ProductController::class,
        order: 2,
        permission: 'Alixar.Product.doCreate'
    )]
    public function doCreate(): bool
    {
        return parent::doCreate();
    }

    /**
     * Define the primary model class for this controller.
     *
     * @return string
     */
    protected function getModelClass(): string
    {
        return Product::class;
    }

    /**
     * Define columns for the list view.
     *
     * @return array
     */
    protected function getListColumns(): array
    {
        return [
            new Text('ref', 'Ref.'),
            new Text('label', 'Label'),
            new Decimal('price', 'Price (Net)'),
            new Decimal('tva_tx', 'VAT %'),
            new Boolean('tosell', 'To Sell'),
            new Boolean('tobuy', 'To Buy'),
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
                'label' => 'Product Information',
                'fields' => [
                    new Text('ref', 'Reference', ['required' => true]),
                    new Text('label', 'Label', ['required' => true]),
                    new Select('fk_product_type', 'Type', [
                        'options' => [
                            0 => 'Product',
                            1 => 'Service'
                        ]
                    ]),
                    new Textarea('description', 'Description'),
                ]
            ],
            'pricing' => [
                'label' => 'Prices and Taxes',
                'fields' => [
                    new Decimal('price', 'Selling Price (Net)'),
                    new Decimal('price_ttc', 'Selling Price (Incl. Tax)'),
                    new Decimal('tva_tx', 'VAT Rate (%)'),
                    new Select('price_base_type', 'Base Type', [
                        'options' => [
                            'HT' => 'Net',
                            'TTC' => 'Incl. Tax'
                        ]
                    ]),
                ]
            ],
            'status' => [
                'label' => 'Status',
                'fields' => [
                    new Boolean('tosell', 'For Sale'),
                    new Boolean('tobuy', 'For Purchase'),
                ]
            ]
        ];
    }

    /**
     * Hook called before building configuration.
     */
    protected function beforeConfig()
    {
        $this->addVariable('title', 'Product Management - Alixar');
    }
}
