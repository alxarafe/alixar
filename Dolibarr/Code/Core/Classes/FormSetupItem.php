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
 * This class help to create item for class formSetup
 */
class FormSetupItem
{
    /**
     * @var DoliDB Database handler.
     */
    public $db;

    /** @var Translate */
    public $langs;

    /** @var int */
    public $entity;

    /** @var Form */
    public $form;


    /** @var string $confKey the conf key used in database */
    public $confKey;

    /** @var string|false $nameText */
    public $nameText = false;

    /** @var string $helpText */
    public $helpText = '';

    /** @var string $picto */
    public $picto = '';

    /** @var string $fieldValue */
    public $fieldValue;

    /** @var string $defaultFieldValue */
    public $defaultFieldValue = null;

    /** @var array $fieldAttr  fields attribute only for compatible fields like input text */
    public $fieldAttr = array();

    /** @var bool|string set this var to override field output will override $fieldInputOverride and $fieldOutputOverride too */
    public $fieldOverride = false;

    /** @var bool|string set this var to override field input */
    public $fieldInputOverride = false;

    /** @var bool|string set this var to override field output */
    public $fieldOutputOverride = false;

    /** @var int $rank  */
    public $rank = 0;

    /** @var array set this var for options on select and multiselect items   */
    public $fieldOptions = array();

    /** @var array set this var to add more parameters */
    public $fieldParams = array();

    /** @var callable $saveCallBack  */
    public $saveCallBack;

    /** @var callable $setValueFromPostCallBack  */
    public $setValueFromPostCallBack;

    /**
     * @var string[] $errors
     */
    public $errors = array();

    /**
     * TODO each type must have setAs{type} method to help configuration
     *   And set var as protected when its done configuration must be done by method
     *   this is important for retrocompatibility of futures versions
     * @var string $type  'string', 'textarea', 'category:'.Categorie::TYPE_CUSTOMER', 'emailtemplate', 'thirdparty_type'
     */
    protected $type = 'string';

    public $enabled = 1;

    /**
     * @var string  The css to use on the input field of item
     */
    public $cssClass = '';

    /**
     * Constructor
     *
     * @param string    $confKey    the conf key used in database
     */
    public function __construct($confKey)
    {
        global $langs, $db, $conf, $form;
        $this->db = $db;

        if (!empty($form) && is_object($form) && get_class($form) == 'Form') { // the form class has a cache inside so I am using it to optimize
            $this->form = $form;
        } else {
            $this->form = new Form($this->db);
        }

        $this->langs = $langs;
        $this->entity = (is_null($this->entity) ? $conf->entity : ((int) $this->entity));

        $this->confKey = $confKey;
        $this->loadValueFromConf();
    }

    /**
     * load conf value from databases
     *
     * @return bool
     */
    public function loadValueFromConf()
    {
        global $conf;
        if (isset($conf->global->{$this->confKey})) {
            $this->fieldValue = getDolGlobalString($this->confKey);
            return true;
        } else {
            $this->fieldValue = '';
            return false;
        }
    }

    /**
     * Reload conf value from databases is an alias of loadValueFromConf
     *
     * @deprecated
     * @return bool
     */
    public function reloadValueFromConf()
    {
        return $this->loadValueFromConf();
    }


    /**
     * Save const value based on htdocs/core/actions_setmoduleoptions.inc.php
     *
     * @return     int                  -1 if KO, 1 if OK
     */
    public function saveConfValue()
    {
        global $hookmanager;

        $parameters = array();
        $reshook = $hookmanager->executeHooks('formSetupBeforeSaveConfValue', $parameters, $this); // Note that $action and $object may have been modified by some hooks
        if ($reshook < 0) {
            $this->setErrors($hookmanager->errors);
            return -1;
        }

        if ($reshook > 0) {
            return $reshook;
        }


        if (!empty($this->saveCallBack) && is_callable($this->saveCallBack)) {
            return call_user_func($this->saveCallBack, $this);
        }

        // Modify constant only if key was posted (avoid resetting key to the null value)
        if ($this->type != 'title') {
            $result = dolibarr_set_const($this->db, $this->confKey, $this->fieldValue, 'chaine', 0, '', $this->entity);
            if ($result < 0) {
                return -1;
            } else {
                return 1;
            }
        }

        return 0;
    }

    /**
     * Set an override function for saving data
     *
     * @param callable $callBack a callable function
     * @return void
     */
    public function setSaveCallBack(callable $callBack)
    {
        $this->saveCallBack = $callBack;
    }

    /**
     * Set an override function for get data from post
     *
     * @param callable $callBack a callable function
     * @return void
     */
    public function setValueFromPostCallBack(callable $callBack)
    {
        $this->setValueFromPostCallBack = $callBack;
    }

    /**
     * Save const value based on htdocs/core/actions_setmoduleoptions.inc.php
     *
     * @return     int                  -1 if KO, 0  nothing to do , 1 if OK
     */
    public function setValueFromPost()
    {
        if (!empty($this->setValueFromPostCallBack) && is_callable($this->setValueFromPostCallBack)) {
            return call_user_func($this->setValueFromPostCallBack);
        }

        // Modify constant only if key was posted (avoid resetting key to the null value)
        if ($this->type != 'title') {
            if (preg_match('/category:/', $this->type)) {
                if (GETPOSTINT($this->confKey) == '-1') {
                    $val_const = '';
                } else {
                    $val_const = GETPOSTINT($this->confKey);
                }
            } elseif ($this->type == 'multiselect') {
                $val = GETPOST($this->confKey, 'array');
                if ($val && is_array($val)) {
                    $val_const = implode(',', $val);
                } else {
                    $val_const = '';
                }
            } elseif ($this->type == 'html') {
                $val_const = GETPOST($this->confKey, 'restricthtml');
            } else {
                $val_const = GETPOST($this->confKey, 'alpha');
            }

            // TODO add value check with class validate
            $this->fieldValue = $val_const;

            return 1;
        }

        return 0;
    }

    /**
     * Get help text or generate it
     *
     * @return int|string
     */
    public function getHelpText()
    {
        if (!empty($this->helpText)) {
            return $this->helpText;
        }
        return (($this->langs->trans($this->confKey . 'Tooltip') != $this->confKey . 'Tooltip') ? $this->langs->trans($this->confKey . 'Tooltip') : '');
    }

    /**
     * Get field name text or generate it
     *
     * @return false|int|string
     */
    public function getNameText()
    {
        if (!empty($this->nameText)) {
            return $this->nameText;
        }
        $out = (($this->langs->trans($this->confKey) != $this->confKey) ? $this->langs->trans($this->confKey) : $this->langs->trans('MissingTranslationForConfKey', $this->confKey));

        // if conf defined on entity 0, prepend a picto to indicate it will apply across all entities
        if (isModEnabled('multicompany') && $this->entity == 0) {
            $out = img_picto($this->langs->trans('AllEntities'), 'fa-globe-americas em088 opacityhigh') . '&nbsp;' . $out;
        }

        return $out;
    }

    /**
     * generate input field
     *
     * @return bool|string
     */
    public function generateInputField()
    {
        global $conf;

        if (!empty($this->fieldOverride)) {
            return $this->fieldOverride;
        }

        if (!empty($this->fieldInputOverride)) {
            return $this->fieldInputOverride;
        }

        // Set default value
        if (is_null($this->fieldValue)) {
            $this->fieldValue = $this->defaultFieldValue;
        }


        $this->fieldAttr['name'] = $this->confKey;
        $this->fieldAttr['id'] = 'setup-' . $this->confKey;
        $this->fieldAttr['value'] = $this->fieldValue;

        $out = '';

        if ($this->type == 'title') {
            $out .= $this->generateOutputField(); // title have no input
        } elseif ($this->type == 'multiselect') {
            $out .= $this->generateInputFieldMultiSelect();
        } elseif ($this->type == 'select') {
            $out .= $this->generateInputFieldSelect();
        } elseif ($this->type == 'selectUser') {
            $out .= $this->generateInputFieldSelectUser();
        } elseif ($this->type == 'textarea') {
            $out .= $this->generateInputFieldTextarea();
        } elseif ($this->type == 'html') {
            $out .= $this->generateInputFieldHtml();
        } elseif ($this->type == 'color') {
            $out .=  $this->generateInputFieldColor();
        } elseif ($this->type == 'yesno') {
            if (!empty($conf->use_javascript_ajax)) {
                $out .= ajax_constantonoff($this->confKey);
            } else {
                $out .= $this->form->selectyesno($this->confKey, $this->fieldValue, 1);
            }
        } elseif (preg_match('/emailtemplate:/', $this->type)) {
            $out .= $this->generateInputFieldEmailTemplate();
        } elseif (preg_match('/category:/', $this->type)) {
            $out .= $this->generateInputFieldCategories();
        } elseif (preg_match('/thirdparty_type/', $this->type)) {
            $formcompany = new FormCompany($this->db);
            $out .= $formcompany->selectProspectCustomerType($this->fieldValue, $this->confKey);
        } elseif ($this->type == 'securekey') {
            $out .= $this->generateInputFieldSecureKey();
        } elseif ($this->type == 'product') {
            if (isModEnabled("product") || isModEnabled("service")) {
                $selected = (empty($this->fieldValue) ? '' : $this->fieldValue);
                $out .= $this->form->select_produits($selected, $this->confKey, '', 0, 0, 1, 2, '', 0, array(), 0, '1', 0, $this->cssClass, 0, '', null, 1);
            }
        } elseif ($this->type == 'selectBankAccount') {
            if (isModEnabled("bank")) {
                $selected = (empty($this->fieldValue) ? '' : $this->fieldValue);
                $out .= $this->form->select_comptes($selected, $this->confKey, 0, '', 0, '', 0, '', 1);
            }
        } elseif ($this->type == 'password') {
            $out .= $this->generateInputFieldPassword('dolibarr');
        } elseif ($this->type == 'genericpassword') {
            $out .= $this->generateInputFieldPassword('generic');
        } else {
            $out .= $this->generateInputFieldText();
        }

        return $out;
    }

    /**
     * generatec default input field
     *
     * @return string
     */
    public function generateInputFieldText()
    {
        if (empty($this->fieldAttr) || empty($this->fieldAttr['class'])) {
            $this->fieldAttr['class'] = 'flat ' . (empty($this->cssClass) ? 'minwidth200' : $this->cssClass);
        }
        return '<input ' . FormSetup::generateAttributesStringFromArray($this->fieldAttr) . ' />';
    }

    /**
     * generate input field for textarea
     *
     * @return string
     */
    public function generateInputFieldTextarea()
    {
        $out = '<textarea class="flat" name="' . $this->confKey . '" id="' . $this->confKey . '" cols="50" rows="5" wrap="soft">' . "\n";
        $out .= dol_htmlentities($this->fieldValue);
        $out .= "</textarea>\n";
        return $out;
    }

    /**
     * generate input field for html
     *
     * @return string
     */
    public function generateInputFieldHtml()
    {
        global $conf;
        require_once constant('DOL_DOCUMENT_ROOT') . '/core/class/doleditor.class.php';
        $doleditor = new DolEditor($this->confKey, $this->fieldValue, '', 160, 'dolibarr_notes', '', false, false, isModEnabled('fckeditor'), ROWS_5, '90%');
        return $doleditor->Create(1);
    }

    /**
     * generate input field for categories
     *
     * @return string
     */
    public function generateInputFieldCategories()
    {
    use Dolibarr\Code\Categories\Classes\Categorie;

        $formother = new FormOther($this->db);

        $tmp = explode(':', $this->type);
        $out = img_picto('', 'category', 'class="pictofixedwidth"');

        $label = 'Categories';
        if ($this->type == 'customer') {
            $label = 'CustomersProspectsCategoriesShort';
        }
        $out .= $formother->select_categories($tmp[1], $this->fieldValue, $this->confKey, 0, $this->langs->trans($label));

        return $out;
    }

    /**
     * generate input field for email template selector
     * @return string
     */
    public function generateInputFieldEmailTemplate()
    {
        global $user;

        $out = '';
        if (preg_match('/emailtemplate:/', $this->type)) {
            include_once DOL_DOCUMENT_ROOT . '/core/class/html.formmail.class.php';
            $formmail = new FormMail($this->db);

            $tmp = explode(':', $this->type);
            $nboftemplates = $formmail->fetchAllEMailTemplate($tmp[1], $user, null, 1); // We set lang=null to get in priority record with no lang
            $arrayOfMessageName = array();
            if (is_array($formmail->lines_model)) {
                foreach ($formmail->lines_model as $modelMail) {
                    $moreonlabel = '';
                    if (!empty($arrayOfMessageName[$modelMail->label])) {
                        $moreonlabel = ' <span class="opacitymedium">(' . $this->langs->trans("SeveralLangugeVariatFound") . ')</span>';
                    }
                    // The 'label' is the key that is unique if we exclude the language
                    $arrayOfMessageName[$modelMail->id] = $this->langs->trans(preg_replace('/\(|\)/', '', $modelMail->label)) . $moreonlabel;
                }
            }
            $out .= $this->form->selectarray($this->confKey, $arrayOfMessageName, $this->fieldValue, 'None', 0, 0, '', 0, 0, 0, '', '', 1);
        }

        return $out;
    }


    /**
     * generate input field for secure key
     *
     * @return string
     */
    public function generateInputFieldSecureKey()
    {
        global $conf;
        $out = '<input type="text" class="flat minwidth150' . ($this->cssClass ? ' ' . $this->cssClass : '') . '" id="' . $this->confKey . '" name="' . $this->confKey . '" value="' . (GETPOST($this->confKey, 'alpha') ? GETPOST($this->confKey, 'alpha') : $this->fieldValue) . '">';

        if (!empty($conf->use_javascript_ajax) && empty($this->fieldParams['hideGenerateButton'])) {
            $out .= '&nbsp;' . img_picto($this->langs->trans('Generate'), 'refresh', 'id="generate_token' . $this->confKey . '" class="linkobject"');

            // Add button to autosuggest a key
            include_once DOL_DOCUMENT_ROOT . '/core/lib/security2.lib.php';
            $out .= dolJSToSetRandomPassword($this->confKey, 'generate_token' . $this->confKey);
        }

        return $out;
    }


    /**
     * generate input field for a password
     *
     * @param   string  $type  'dolibarr' (dolibarr password rules apply) or 'generic'
     *
     * @return  string
     */
    public function generateInputFieldPassword($type = 'generic')
    {
        global $conf, $langs, $user;

        $min = 6;
        $max = 50;
        if ($type == 'dolibarr') {
            $gen = getDolGlobalString('USER_PASSWORD_GENERATED', 'standard');
            if ($gen == 'none') {
                $gen = 'standard';
            }
            $nomclass = "modGeneratePass" . ucfirst($gen);
            $nomfichier = $nomclass . ".class.php";
            require_once DOL_DOCUMENT_ROOT . "/core/modules/security/generate/" . $nomfichier;
            $genhandler = new $nomclass($this->db, $conf, $langs, $user);
            $min = $genhandler->length;
            $max = $genhandler->length2;
        }
        $out = '<input required="required" type="password" class="flat" id="' . $this->confKey . '" name="' . $this->confKey . '" value="' . (GETPOST($this->confKey, 'alpha') ? GETPOST($this->confKey, 'alpha') : $this->fieldValue) . '"';
        if ($min) {
            $out .= ' minlength="' . $min . '"';
        }
        if ($max) {
            $out .= ' maxlength="' . $max . '"';
        }
        $out .= '>';
        return $out;
    }



    /**
     * generateInputFieldMultiSelect
     *
     * @return string
     */
    public function generateInputFieldMultiSelect()
    {
        $TSelected = array();
        if ($this->fieldValue) {
            $TSelected = explode(',', $this->fieldValue);
        }

        return $this->form->multiselectarray($this->confKey, $this->fieldOptions, $TSelected, 0, 0, '', 0, 0, 'style="min-width:100px"');
    }


    /**
     * generateInputFieldSelect
     *
     * @return string
     */
    public function generateInputFieldSelect()
    {
        $s = '';
        if ($this->picto) {
            $s .= img_picto('', $this->picto, 'class="pictofixedwidth"');
        }
        $s .= $this->form->selectarray($this->confKey, $this->fieldOptions, $this->fieldValue, 0, 0, 0, '', 0, 0, 0, '', $this->cssClass);

        return $s;
    }

    /**
     * @return string
     */
    public function generateInputFieldSelectUser()
    {
        return $this->form->select_dolusers($this->fieldValue, $this->confKey);
    }

    /**
     * get the type : used for old module builder setup conf style conversion and tests
     * because this two class will quickly evolve it's important to not set or get directly $this->type (will be protected) so this method exist
     * to be sure we can manage evolution easily
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * set the type from string : used for old module builder setup conf style conversion and tests
     * because this two class will quickly evolve it's important to not set directly $this->type (will be protected) so this method exist
     * to be sure we can manage evolution easily
     *
     * @param       string  $type   Possible values based on old module builder setup : 'string', 'textarea', 'category:'.Categorie::TYPE_CUSTOMER', 'emailtemplate', 'thirdparty_type'
     * @deprecated                  this setTypeFromTypeString came deprecated because it exists only for manage setup conversion
     * @return      bool
     */
    public function setTypeFromTypeString($type)
    {
        $this->type = $type;

        return true;
    }

    /**
     * Add error
     *
     * @param array|string $errors the error text
     * @return null
     */
    public function setErrors($errors)
    {
        if (is_array($errors)) {
            if (!empty($errors)) {
                foreach ($errors as $error) {
                    $this->setErrors($error);
                }
            }
        } elseif (!empty($errors)) {
            $this->errors[] = $errors;
        }
        return null;
    }

    /**
     * generateOutputField
     *
     * @return bool|string      Generate the output html for this item
     */
    public function generateOutputField()
    {
        global $conf, $user, $langs;

        if (!empty($this->fieldOverride)) {
            return $this->fieldOverride;
        }

        if (!empty($this->fieldOutputOverride)) {
            return $this->fieldOutputOverride;
        }

        $out = '';

        if ($this->type == 'title') {
            // nothing to do
        } elseif ($this->type == 'textarea') {
            $out .= dol_nl2br($this->fieldValue);
        } elseif ($this->type == 'multiselect') {
            $out .= $this->generateOutputFieldMultiSelect();
        } elseif ($this->type == 'select') {
            $out .= $this->generateOutputFieldSelect();
        } elseif ($this->type == 'selectUser') {
            $out .= $this->generateOutputFieldSelectUser();
        } elseif ($this->type == 'html') {
            $out .=  $this->fieldValue;
        } elseif ($this->type == 'color') {
            $out .=  $this->generateOutputFieldColor();
        } elseif ($this->type == 'yesno') {
            if (!empty($conf->use_javascript_ajax)) {
                $out .= ajax_constantonoff($this->confKey, array(), $this->entity); // TODO possibility to add $input parameter
            } else {
                if ($this->fieldValue == 1) {
                    $out .= $langs->trans('yes');
                } else {
                    $out .= $langs->trans('no');
                }
            }
        } elseif (preg_match('/emailtemplate:/', $this->type)) {
            if ($this->fieldValue > 0) {
                include_once DOL_DOCUMENT_ROOT . '/core/class/html.formmail.class.php';
                $formmail = new FormMail($this->db);

                $tmp = explode(':', $this->type);

                $template = $formmail->getEMailTemplate($this->db, $tmp[1], $user, $this->langs, $this->fieldValue);
                if (is_numeric($template) && $template < 0) {
                    $this->setErrors($formmail->errors);
                }
                $out .= $this->langs->trans($template->label);
            }
        } elseif (preg_match('/category:/', $this->type)) {
            use Dolibarr\Code\Categories\Classes\Categorie;

            $c = new Categorie($this->db);
            $result = $c->fetch($this->fieldValue);
            if ($result < 0) {
                $this->setErrors($c->errors);
            }
            $ways = $c->print_all_ways(' &gt;&gt; ', 'none', 0, 1); // $ways[0] = "ccc2 >> ccc2a >> ccc2a1" with html formatted text
            $toprint = array();
            foreach ($ways as $way) {
                $toprint[] = '<li class="select2-search-choice-dolibarr noborderoncategories"' . ($c->color ? ' style="background: #' . $c->color . ';"' : ' style="background: #bbb"') . '>' . $way . '</li>';
            }
            $out .= '<div class="select2-container-multi-dolibarr" style="width: 90%;"><ul class="select2-choices-dolibarr">' . implode(' ', $toprint) . '</ul></div>';
        } elseif (preg_match('/thirdparty_type/', $this->type)) {
            if ($this->fieldValue == 2) {
                $out .= $this->langs->trans("Prospect");
            } elseif ($this->fieldValue == 3) {
                $out .= $this->langs->trans("ProspectCustomer");
            } elseif ($this->fieldValue == 1) {
                $out .= $this->langs->trans("Customer");
            } elseif ($this->fieldValue == 0) {
                $out .= $this->langs->trans("NorProspectNorCustomer");
            }
        } elseif ($this->type == 'product') {

            $product = new Product($this->db);
            $resprod = $product->fetch($this->fieldValue);
            if ($resprod > 0) {
                $out .= $product->ref;
            } elseif ($resprod < 0) {
                $this->setErrors($product->errors);
            }
        } elseif ($this->type == 'selectBankAccount') {

            $bankaccount = new Account($this->db);
            $resbank = $bankaccount->fetch($this->fieldValue);
            if ($resbank > 0) {
                $out .= $bankaccount->label;
            } elseif ($resbank < 0) {
                $this->setErrors($bankaccount->errors);
            }
        } elseif ($this->type == 'password' || $this->type == 'genericpassword') {
            $out .= str_repeat('*', strlen($this->fieldValue));
        } else {
            $out .= $this->fieldValue;
        }

        return $out;
    }


    /**
     * generateOutputFieldMultiSelect
     *
     * @return string
     */
    public function generateOutputFieldMultiSelect()
    {
        $outPut = '';
        $TSelected = array();
        if (!empty($this->fieldValue)) {
            $TSelected = explode(',', $this->fieldValue);
        }

        if (!empty($TSelected)) {
            foreach ($TSelected as $selected) {
                if (!empty($this->fieldOptions[$selected])) {
                    $outPut .= dolGetBadge('', $this->fieldOptions[$selected], 'info') . ' ';
                }
            }
        }
        return $outPut;
    }

    /**
     * generateOutputFieldColor
     *
     * @return string
     */
    public function generateOutputFieldColor()
    {
        global $langs;
        $this->fieldAttr['disabled'] = null;
        $color = colorArrayToHex(colorStringToArray($this->fieldValue, array()), '');
        if ($color) {
            return '<input type="text" class="colorthumb" disabled="disabled" style="padding: 1px; margin-top: 0; margin-bottom: 0; background-color: #' . $color . '" value="' . $color . '">';
        }
        return $langs->trans("Default");
    }
    /**
     * generateInputFieldColor
     *
     * @return string
     */
    public function generateInputFieldColor()
    {
        $this->fieldAttr['type'] = 'color';
        $default = $this->defaultFieldValue;
        include_once DOL_DOCUMENT_ROOT . '/core/class/html.formother.class.php';
        $formother = new FormOther($this->db);
        return $formother->selectColor(colorArrayToHex(colorStringToArray($this->fieldAttr['value'], array()), ''), $this->fieldAttr['name'], '', 1, array(), '', '', $default) . ' ';
    }

    /**
     * generateOutputFieldSelect
     *
     * @return string
     */
    public function generateOutputFieldSelect()
    {
        $outPut = '';
        if (!empty($this->fieldOptions[$this->fieldValue])) {
            $outPut = $this->fieldOptions[$this->fieldValue];
        }

        return $outPut;
    }

    /**
     * generateOutputFieldSelectUser
     *
     * @return string
     */
    public function generateOutputFieldSelectUser()
    {
        $outPut = '';
        $user = new User($this->db);
        $user->fetch($this->fieldValue);
        $outPut = $user->firstname . " " . $user->lastname;
        return $outPut;
    }

    /*
     * METHODS FOR SETTING DISPLAY TYPE
     */

    /**
     * Set type of input as string
     *
     * @return self
     */
    public function setAsString()
    {
        $this->type = 'string';
        return $this;
    }

    /**
     * Set type of input as color
     *
     * @return self
     */
    public function setAsColor()
    {
        $this->type = 'color';
        return $this;
    }

    /**
     * Set type of input as textarea
     *
     * @return self
     */
    public function setAsTextarea()
    {
        $this->type = 'textarea';
        return $this;
    }

    /**
     * Set type of input as html editor
     *
     * @return self
     */
    public function setAsHtml()
    {
        $this->type = 'html';
        return $this;
    }

    /**
     * Set type of input as emailtemplate selector
     *
     * @param string $templateType email template type
     * @return self
     */
    public function setAsEmailTemplate($templateType)
    {
        $this->type = 'emailtemplate:' . $templateType;
        return $this;
    }

    /**
     * Set type of input as thirdparty_type selector
     *
     * @return self
     */
    public function setAsThirdpartyType()
    {
        $this->type = 'thirdparty_type';
        return $this;
    }

    /**
     * Set type of input as Yes
     *
     * @return self
     */
    public function setAsYesNo()
    {
        $this->type = 'yesno';
        return $this;
    }

    /**
     * Set type of input as secure key
     *
     * @return self
     */
    public function setAsSecureKey()
    {
        $this->type = 'securekey';
        return $this;
    }

    /**
     * Set type of input as product
     *
     * @return self
     */
    public function setAsProduct()
    {
        $this->type = 'product';
        return $this;
    }

    /**
     * Set type of input as a category selector
     * TODO add default value
     *
     * @param   int     $catType        Type of category ('customer', 'supplier', 'contact', 'product', 'member'). Old mode (0, 1, 2, ...) is deprecated.
     * @return self
     */
    public function setAsCategory($catType)
    {
        $this->type = 'category:' . $catType;
        return $this;
    }

    /**
     * Set type of input as a simple title. No data to store
     *
     * @return self
     */
    public function setAsTitle()
    {
        $this->type = 'title';
        return $this;
    }


    /**
     * Set type of input as a simple title. No data to store
     *
     * @param array $fieldOptions A table of field options
     * @return self
     */
    public function setAsMultiSelect($fieldOptions)
    {
        if (is_array($fieldOptions)) {
            $this->fieldOptions = $fieldOptions;
        }

        $this->type = 'multiselect';
        return $this;
    }

    /**
     * Set type of input as a simple title. No data to store
     *
     * @param array $fieldOptions  A table of field options
     * @return self
     */
    public function setAsSelect($fieldOptions)
    {
        if (is_array($fieldOptions)) {
            $this->fieldOptions = $fieldOptions;
        }

        $this->type = 'select';
        return $this;
    }

    /**
     * Set type of input as a simple title. No data to store
     *
     * @return self
     */
    public function setAsSelectUser()
    {
        $this->type = 'selectUser';
        return $this;
    }

    /**
     * Set type of input as a simple title. No data to store
     *
     * @return self
     */
    public function setAsSelectBankAccount()
    {
        $this->type = 'selectBankAccount';
        return $this;
    }

    /**
     * Set type of input as a password with dolibarr password rules apply.
     * Hide entry on display.
     *
     * @return self
     */
    public function setAsPassword()
    {
        $this->type = 'password';
        return $this;
    }

    /**
     * Set type of input as a generic password without dolibarr password rules (for external passwords for example).
     * Hide entry on display.
     *
     * @return self
     */
    public function setAsGenericPassword()
    {
        $this->type = 'genericpassword';
        return $this;
    }
}
