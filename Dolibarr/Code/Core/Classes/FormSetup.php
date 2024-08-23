<?php

/* Copyright (C) 2021       John BOTELLA                <john.botella@atm-consulting.fr>
 * Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
 * Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Code\Core\Classes;

use DoliDB;

/**
 * This class help you create setup render
 */
class FormSetup
{
    /**
     * @var DoliDB Database handler.
     */
    public $db;

    /** @var int */
    public $entity;

    /** @var FormSetupItem[]  */
    public $items = array();

    /**
     * @var int
     */
    public $setupNotEmpty = 0;

    /** @var Translate */
    public $langs;

    /** @var Form */
    public $form;

    /** @var int */
    protected $maxItemRank;

    /**
     * this is an html string display before output form
     * @var string
     */
    public $htmlBeforeOutputForm = '';

    /**
     * this is an html string display after output form
     * @var string
     */
    public $htmlAfterOutputForm = '';

    /**
     * this is an html string display on buttons zone
     * @var string
     */
    public $htmlOutputMoreButton = '';


    /**
     *
     * @var array
     */
    public $formAttributes = array(
        'action' => '', // set in __construct
        'method' => 'POST'
    );

    /**
     * an list of hidden inputs used only in edit mode
     * @var array
     */
    public $formHiddenInputs = array();

    /**
     * @var string[] $errors
     */
    public $errors = array();


    /**
     * Constructor
     *
     * @param DoliDB $db Database handler
     * @param Translate $outputLangs if needed can use another lang
     */
    public function __construct($db, $outputLangs = null)
    {
        global $conf, $langs;

        $this->db = $db;

        $this->form = new Form($this->db);
        $this->formAttributes['action'] = $_SERVER["PHP_SELF"];

        $this->formHiddenInputs['token'] = newToken();
        $this->formHiddenInputs['action'] = 'update';

        $this->entity = (is_null($this->entity) ? $conf->entity : $this->entity);

        if ($outputLangs) {
            $this->langs = $outputLangs;
        } else {
            $this->langs = $langs;
        }
    }

    /**
     * Generate an attributes string form an input array
     *
     * @param   array   $attributes     an array of attributes keys and values,
     * @return  string                  attribute string
     */
    public static function generateAttributesStringFromArray($attributes)
    {
        $Aattr = array();
        if (is_array($attributes)) {
            foreach ($attributes as $attribute => $value) {
                if (is_array($value) || is_object($value)) {
                    continue;
                }
                $Aattr[] = $attribute . '="' . dol_escape_htmltag($value) . '"';
            }
        }

        return !empty($Aattr) ? implode(' ', $Aattr) : '';
    }


    /**
     * Generate the form (in read or edit mode depending on $editMode)
     *
     * @param   bool    $editMode   true will display output on edit mod
     * @param   bool    $hideTitle  True to hide the first title line
     * @return  string              Html output
     */
    public function generateOutput($editMode = false, $hideTitle = false)
    {
        global $hookmanager, $action;

        require_once constant('DOL_DOCUMENT_ROOT') . '/core/class/html.form.class.php';

        $parameters = array(
            'editMode' => $editMode
        );
        $reshook = $hookmanager->executeHooks('formSetupBeforeGenerateOutput', $parameters, $this, $action); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
        }

        if ($reshook > 0) {
            return $hookmanager->resPrint;
        } else {
            $out = '<!-- Start generateOutput from FormSetup class  -->';
            $out .= $this->htmlBeforeOutputForm;

            if ($editMode) {
                $out .= '<form ' . self::generateAttributesStringFromArray($this->formAttributes) . ' >';

                // generate hidden values from $this->formHiddenInputs
                if (!empty($this->formHiddenInputs) && is_array($this->formHiddenInputs)) {
                    foreach ($this->formHiddenInputs as $hiddenKey => $hiddenValue) {
                        $out .= '<input type="hidden" name="' . dol_escape_htmltag($hiddenKey) . '" value="' . dol_escape_htmltag($hiddenValue) . '">';
                    }
                }
            }

            // generate output table
            $out .= $this->generateTableOutput($editMode, $hideTitle);


            $reshook = $hookmanager->executeHooks('formSetupBeforeGenerateOutputButton', $parameters, $this, $action); // Note that $action and $object may have been modified by some hooks
            if ($reshook < 0) {
                setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
            }

            if ($reshook > 0) {
                return $hookmanager->resPrint;
            } elseif ($editMode) {
                $out .= '<div class="form-setup-button-container center">'; // Todo : remove .center by adding style to form-setup-button-container css class in all themes
                $out .= $this->htmlOutputMoreButton;
                $out .= '<input class="button button-save" type="submit" value="' . $this->langs->trans("Save") . '">'; // Todo fix dolibarr style for <button and use <button instead of input
                /*$out .= ' &nbsp;&nbsp; ';
                $out .= '<a class="button button-cancel" type="submit" href="' . $this->formAttributes['action'] . '">'.$this->langs->trans('Cancel').'</a>';
                */
                $out .= '</div>';
            }

            if ($editMode) {
                $out .= '</form>';
            }

            $out .= $this->htmlAfterOutputForm;

            return $out;
        }
    }

    /**
     * generateTableOutput
     *
     * @param   bool    $editMode   True will display output on edit modECM
     * @param   bool    $hideTitle  True to hide the first title line
     * @return  string              Html output
     */
    public function generateTableOutput($editMode = false, $hideTitle = false)
    {
        global $hookmanager, $action;
        require_once constant('DOL_DOCUMENT_ROOT') . '/core/class/html.form.class.php';

        $parameters = array(
            'editMode' => $editMode
        );
        $reshook = $hookmanager->executeHooks('formSetupBeforeGenerateTableOutput', $parameters, $this, $action); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            setEventMessages($hookmanager->error, $hookmanager->errors, 'errors');
        }

        if ($reshook > 0) {
            return $hookmanager->resPrint;
        } else {
            $out = '<table class="noborder centpercent">';
            if (empty($hideTitle)) {
                $out .= '<thead>';
                $out .= '<tr class="liste_titre">';
                $out .= '	<td>' . $this->langs->trans("Parameter") . '</td>';
                $out .= '	<td>' . $this->langs->trans("Value") . '</td>';
                $out .= '</tr>';
                $out .= '</thead>';
            }

            // Sort items before render
            $this->sortingItems();

            $out .= '<tbody>';
            foreach ($this->items as $item) {
                $out .= $this->generateLineOutput($item, $editMode);
            }
            $out .= '</tbody>';

            $out .= '</table>';
            return $out;
        }
    }

    /**
     * saveConfFromPost
     *
     * @param   bool        $noMessageInUpdate display event message on errors and success
     * @return  int|null    Return -1 if KO, 1 if OK, null if no items
     */
    public function saveConfFromPost($noMessageInUpdate = false)
    {
        global $hookmanager, $conf;

        $parameters = array();
        $reshook = $hookmanager->executeHooks('formSetupBeforeSaveConfFromPost', $parameters, $this); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            $this->errors = $hookmanager->errors;
            return -1;
        }

        if ($reshook > 0) {
            return $reshook;
        }

        if (empty($this->items)) {
            return null;
        }

        $this->db->begin();
        $error = 0;
        foreach ($this->items as $item) {
            if ($item->getType() == 'yesno' && !empty($conf->use_javascript_ajax)) {
                continue;
            }

            $res = $item->setValueFromPost();
            if ($res > 0) {
                $item->saveConfValue();
            } elseif ($res < 0) {
                $error++;
                break;
            }
        }

        if (!$error) {
            $this->db->commit();
            if (empty($noMessageInUpdate)) {
                setEventMessages($this->langs->trans("SetupSaved"), null);
            }
            return 1;
        } else {
            $this->db->rollback();
            if (empty($noMessageInUpdate)) {
                setEventMessages($this->langs->trans("SetupNotSaved"), null, 'errors');
            }
            return -1;
        }
    }

    /**
     * generateLineOutput
     *
     * @param   FormSetupItem   $item       the setup item
     * @param   bool            $editMode   Display as edit mod
     * @return  string                      the html output for an setup item
     */
    public function generateLineOutput($item, $editMode = false)
    {
        $out = '';
        if ($item->enabled == 1) {
            $trClass = 'oddeven';
            if ($item->getType() == 'title') {
                $trClass = 'liste_titre';
            }

            $this->setupNotEmpty++;
            $out .= '<tr class="' . $trClass . '">';

            $out .= '<td class="col-setup-title">';
            $out .= '<span id="helplink' . $item->confKey . '" class="spanforparamtooltip">';
            $out .= $this->form->textwithpicto($item->getNameText(), $item->getHelpText(), 1, 'info', '', 0, 3, 'tootips' . $item->confKey);
            $out .= '</span>';
            $out .= '</td>';

            $out .= '<td>';

            if ($editMode) {
                $out .= $item->generateInputField();
            } else {
                $out .= $item->generateOutputField();
            }

            if (!empty($item->errors)) {
                // TODO : move set event message in a methode to be called by cards not by this class
                setEventMessages(null, $item->errors, 'errors');
            }

            $out .= '</td>';
            $out .= '</tr>';
        }

        return $out;
    }


    /**
     * Method used to test  module builder conversion to this form usage
     *
     * @param   array   $params     an array of arrays of params from old modulBuilder params
     * @return  boolean
     */
    public function addItemsFromParamsArray($params)
    {
        if (!is_array($params) || empty($params)) {
            return false;
        }
        foreach ($params as $confKey => $param) {
            $this->addItemFromParams($confKey, $param); // todo manage error
        }
        return true;
    }


    /**
     * From old
     * Method was used to test  module builder conversion to this form usage.
     *
     * @param   string  $confKey    the conf name to store
     * @param   array   $params     an array of params from old modulBuilder params
     * @return  bool
     */
    public function addItemFromParams($confKey, $params)
    {
        if (empty($confKey) || empty($params['type'])) {
            return false;
        }

        /*
         * Example from old module builder setup page
         *  // 'MYMODULE_MYPARAM1'=>array('type'=>'string', 'css'=>'minwidth500' ,'enabled'=>1),
            // 'MYMODULE_MYPARAM2'=>array('type'=>'textarea','enabled'=>1),
            //'MYMODULE_MYPARAM3'=>array('type'=>'category:'.Categorie::TYPE_CUSTOMER, 'enabled'=>1),
            //'MYMODULE_MYPARAM4'=>array('type'=>'emailtemplate:thirdparty', 'enabled'=>1),
            //'MYMODULE_MYPARAM5'=>array('type'=>'yesno', 'enabled'=>1),
            //'MYMODULE_MYPARAM5'=>array('type'=>'thirdparty_type', 'enabled'=>1),
            //'MYMODULE_MYPARAM6'=>array('type'=>'securekey', 'enabled'=>1),
            //'MYMODULE_MYPARAM7'=>array('type'=>'product', 'enabled'=>1),
         */

        $item = new FormSetupItem($confKey);
        // need to be ignored from scrutinizer setTypeFromTypeString was created as deprecated to incite developer to use object oriented usage
        // @phan-suppress-next-line PhanDeprecatedFunction
        /** @scrutinizer ignore-deprecated */ $item->setTypeFromTypeString($params['type']);

        if (!empty($params['enabled'])) {
            $item->enabled = $params['enabled'];
        }

        if (!empty($params['css'])) {
            $item->cssClass = $params['css'];
        }

        $this->items[$item->confKey] = $item;

        return true;
    }

    /**
     * Used to export param array for /core/actions_setmoduleoptions.inc.php template
     * Method exists only for manage setup conversion
     *
     * @return array $arrayofparameters for /core/actions_setmoduleoptions.inc.php
     */
    public function exportItemsAsParamsArray()
    {
        $arrayofparameters = array();
        foreach ($this->items as $item) {
            $arrayofparameters[$item->confKey] = array(
                'type' => $item->getType(),
                'enabled' => $item->enabled
            );
        }

        return $arrayofparameters;
    }

    /**
     * Reload for each item default conf
     * note: this will override custom configuration
     *
     * @return bool
     */
    public function reloadConfs()
    {
        if (!array($this->items)) {
            return false;
        }
        foreach ($this->items as $item) {
            $item->loadValueFromConf();
        }

        return true;
    }


    /**
     * Create a new item
     * The target is useful with hooks : that allow externals modules to add setup items on good place
     *
     * @param string    $confKey                the conf key used in database
     * @param string    $targetItemKey          target item used to place the new item beside
     * @param bool      $insertAfterTarget      insert before or after target item ?
     * @return FormSetupItem                    the new setup item created
     */
    public function newItem($confKey, $targetItemKey = '', $insertAfterTarget = false)
    {
        $item = new FormSetupItem($confKey);

        $item->entity = $this->entity;

        // set item rank if not defined as last item
        if (empty($item->rank)) {
            $item->rank = $this->getCurentItemMaxRank() + 1;
            $this->setItemMaxRank($item->rank); // set new max rank if needed
        }

        // try to get rank from target column, this will override item->rank
        if (!empty($targetItemKey)) {
            if (isset($this->items[$targetItemKey])) {
                $targetItem = $this->items[$targetItemKey];
                $item->rank = $targetItem->rank; // $targetItem->rank will be increase after
                if ($targetItem->rank >= 0 && $insertAfterTarget) {
                    $item->rank++;
                }
            }

            // calc new rank for each item to make place for new item
            foreach ($this->items as $fItem) {
                if ($item->rank <= $fItem->rank) {
                    $fItem->rank = $fItem->rank + 1;
                    $this->setItemMaxRank($fItem->rank); // set new max rank if needed
                }
            }
        }

        $this->items[$item->confKey] = $item;
        return $this->items[$item->confKey];
    }

    /**
     * Sort items according to rank
     *
     * @return bool
     */
    public function sortingItems()
    {
        // Sorting
        return uasort($this->items, array($this, 'itemSort'));
    }

    /**
     * getCurentItemMaxRank
     *
     * @param bool $cache To use cache or not
     * @return int
     */
    public function getCurentItemMaxRank($cache = true)
    {
        if (empty($this->items)) {
            return 0;
        }

        if ($cache && $this->maxItemRank > 0) {
            return $this->maxItemRank;
        }

        $this->maxItemRank = 0;
        foreach ($this->items as $item) {
            $this->maxItemRank = max($this->maxItemRank, $item->rank);
        }

        return $this->maxItemRank;
    }


    /**
     * set new max rank if needed
     *
     * @param   int         $rank   the item rank
     * @return  int|void            new max rank
     */
    public function setItemMaxRank($rank)
    {
        $this->maxItemRank = max($this->maxItemRank, $rank);
    }


    /**
     * get item position rank from item key
     *
     * @param   string      $itemKey        the item key
     * @return  int                         rank on success and -1 on error
     */
    public function getLineRank($itemKey)
    {
        if (!isset($this->items[$itemKey]->rank)) {
            return -1;
        }
        return  $this->items[$itemKey]->rank;
    }


    /**
     *  uasort callback function to Sort params items
     *
     *  @param  FormSetupItem   $a  formSetup item
     *  @param  FormSetupItem   $b  formSetup item
     *  @return int                 Return compare result
     */
    public function itemSort(FormSetupItem $a, FormSetupItem $b)
    {
        if (empty($a->rank)) {
            $a->rank = 0;
        }
        if (empty($b->rank)) {
            $b->rank = 0;
        }
        if ($a->rank == $b->rank) {
            return 0;
        }
        return ($a->rank < $b->rank) ? -1 : 1;
    }
}
