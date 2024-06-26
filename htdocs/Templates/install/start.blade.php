@extends('install/master/install_layout')

@section('body')
    @dump($me)
    <tbody>
    <input type="hidden" name="action" value="config">
    <input type="hidden" name="language" value="{!! $me->config->main->language !!}">
    <div>
        @foreach($me->vars->errors ?? [] as $error)
            <div class="error">{!! $error !!}</div>
        @endforeach
        <table class="nobordernopadding @if ($me->vars->install_noedit) hidewhennoedit @endif">
            <tr>
                <td colspan="3" class="label">
                    <h3>
                        <img class="valignmiddle inline-block paddingright"
                             src="{!! $me->config->main->url !!}/Templates/common/octicons/build/svg/globe.svg"
                             width="20" alt="webserver">{!! $me->langs->trans("WebServer") !!}
                    </h3>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <label for="main_dir"><b>{!! $me->langs->trans("WebPagesDirectory") !!}</b></label></td>
                <td class="label">
                    <input type="text"
                           class="minwidth300"
                           name="base_path"
                           value="{!! $me->config->main->path !!}"
                           disabled
                    >
                </td>
                <td class="comment">
                    <span class="opacitymedium">{!! $me->langs->trans("WithNoSlashAtTheEnd") !!}</span><br>
                    {!! $me->langs->trans("Examples") !!}:<br>
                    <ul>
                        <li>/var/www/dolibarr/htdocs</li>
                        <li>C:/wwwroot/dolibarr/htdocs</li>
                    </ul>
                </td>
            </tr>

            <!-- Root URL $dolibarr_main_url_root -->
            <tr>
                <td class="label"><label for="main_url"><b>{!! $me->langs->trans("URLRoot") !!}</b></label>
                </td>
                <td class="label">
                    <input type="text"
                           class="minwidth300"
                           id="base_url"
                           name="base_url"
                           value="{!! $me->config->main->url !!} "
                           disabled
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("Examples") !!}:<br>
                    <ul>
                        <li>http://localhost/</li>
                        <li>http://www.myserver.com:8180/dolibarr</li>
                        <li>https://www.myvirtualfordolibarr.com/</li>
                    </ul>
                </td>
            </tr>

            <!-- Documents URL $dolibarr_main_data_root -->
            <tr>
                <td class="label">
                    <label for="main_data_dir"><b>{!! $me->langs->trans("DocumentsDirectory") !!}</b></label>
                </td>
                <td class="label">
                    <input type="text"
                           class="minwidth300"
                           id="documents"
                           name="documents"
                           value="{!! $me->config->main->data !!}"
                           @if (!empty($me->vars->install_noedit)) disabled @endif
                    >
                </td>
                <td class="comment">
                    '<span class="opacitymedium">{!! $me->langs->trans("WithNoSlashAtTheEnd") !!}</span><br>
                    {!! $me->langs->trans("DirectoryRecommendation") !!}<br>
                    {!! $me->langs->trans("Examples") !!}:<br>
                    <ul>
                        <li>/var/lib/dolibarr/documents</li>
                        <li>C:/My Documents/dolibarr/documents</li>
                    </ul>
                </td>
            </tr>

            @if (!empty($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == 'on')
                <!--  // Enabled if the installation process is "https://" -->
                <tr>
                    <td class="label">
                        <label for="force_https">{!! $me->langs->trans("ForceHttps") !!}</label></td>
                    <td class="label">
                        <input type="hidden" name="force_https" value="off">
                        <input type="checkbox"
                               id="force_https"
                               name="force_https"
                               value="on"
                               @if (!empty($me->vars->force_https)) checked @endif
                               @if($me->vars->install_noedit == 2 && $me->vars->force_https !== null) disabled @endif
                        >
                    </td>
                    <td class="comment">{!! $me->langs->trans("CheckToForceHttps") !!}
                    </td>
                </tr>
            @endif

            <!-- Dolibarr database -->
            <tr>
                <td colspan="3" class="label"><br>
                    <h3>
                        <img class="valignmiddle inline-block paddingright"
                             src="{!! $me->config->main->url !!}/Templates/common/octicons/build/svg/database.svg"
                             width="20" alt="webserver"> {!! $me->langs->trans("DolibarrDatabase") !!}
                    </h3>
                </td>
            </tr>

            <tr>
                <td class="label">
                    <label for="db_name"><b>{!! $me->langs->trans("DatabaseName") !!}</b></label>
                </td>
                <td class="label">
                    <input type="text"
                           id="db_name"
                           name="db_name"
                           value="{!! !empty($me->config->db->name) ? $me->config->db->name : (empty($me->force_install_database) ? 'alixar' : $me->force_install_database) !!}"
                           @if ($me->vars->install_noedit == 2 && $me->force_install_database !== null)  disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("DatabaseName") !!}</td>
            </tr>

            <tr>
                <!-- Driver type -->
                <td class="label">
                    <label for="db_type"><b>{!! $me->langs->trans("DriverType") !!}</b></label>
                </td>
                <td class="label">
                    <select id="db_type"
                            name="db_type"
                            @if ($me->vars->install_noedit == 2 && $me->force_install_type !== null) disabled @endif
                    >
                        @foreach($me->vars->db_types as $key => $db_type)
                            <option value="{!! $db_type['classname'] !!}"
                                    @if($key === $me->config->db->type) selected @endif
                                    @if(!empty($db_type['comment'])) disabled @endif
                            >{!! $db_type['shortname'] . ' ' . $db_type['min_version'] . ' ' . $db_type['comment'] !!}</option>
                        @endforeach
                    </select>
                </td>
                <td class="comment">{!! $me->langs->trans("DatabaseType") !!}</td>
            </tr>

            <tr class="hidesqlite">
                <td class="label"><label for="db_host"><b>{!! $me->langs->trans("DatabaseServer") !!}</b></label>
                </td>
                <td class="label">
                    <input type="text"
                           id="db_host"
                           name="db_host"
                           value="{!! (!empty($me->force_install_dbserver) ? $me->force_install_dbserver : (!empty($dolibarr_main_db_host) ? $dolibarr_main_db_host : 'localhost')) !!}"
                           @if ($me->vars->install_noedit == 2 && $me->force_install_dbserver !== null) disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("ServerAddressDescription") !!}
                </td>

            </tr>

            <tr class="hidesqlite">
                <td class="label"><label for="db_port">{!! $me->langs->trans("Port") !!}</label></td>
                <td class="label">
                    <input type="text"
                           name="db_port"
                           id="db_port"
                           value="{!! $me->config->db->port !!}"
                           @if ($me->vars->install_noedit == 2 && $me->force_install_port !== null) disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("ServerPortDescription") !!}
                </td>

            </tr>

            <tr class="hidesqlite">
                <td class="label"><label for="db_prefix">{!! $me->langs->trans("DatabasePrefix") !!}</label></td>
                <td class="label">
                    <input type="text"
                           id="db_prefix"
                           name="db_prefix"
                           value="{!! $me->config->db->prefix !!}"
                           @if ($me->vars->install_noedit == 2 && $me->force_install_prefix !== null) disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("DatabasePrefixDescription") !!}</td>
            </tr>

            <tr class="hidesqlite">
                <td class="label">
                    <label for="db_create_database">{!! $me->langs->trans("CreateDatabase") !!}</label></td>
                <td class="label">
                    <input type="checkbox"
                           id="db_create_database"
                           name="db_create_database"
                           value="on"
                           @if ($me->vars->create_database) checked @endif
                           @if ($me->vars->install_noedit) disabled @endif
                    >
                </td>
                <td class="comment">
                    {!! $me->langs->trans("CheckToCreateDatabase") !!}
                </td>
            </tr>

            <tr class="hidesqlite">
                <td class="label"><label for="db_user"><b>{!! $me->langs->trans("Login") !!}</b></label></td>
                <td class="label">
                    <input type="text"
                           id="db_user"
                           name="db_user"
                           value="{!! $me->config->db->user!!}"
                           @if($me->vars->install_noedit == 2 && $me->force_install_databaselogin !== null) disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("AdminLogin") !!}</td>
            </tr>

            <tr class="hidesqlite">
                <td class="label"><label for="db_pass"><b>{!! $me->langs->trans("Password") !!}</b></label></td>
                <td class="label">
                    <input type="password" class="text-security"
                           id="db_pass" autocomplete="off"
                           name="db_pass"
                           value="{!! $me->config->db->pass !!}"
                           @if($me->vars->install_noedit == 2 && $me->force_install_databasepass !== null) disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("AdminPassword") !!}</td>
            </tr>

            <tr class="hidesqlite">
                <td class="label"><label for="db_create_user">{!! $me->langs->trans("CreateUser") !!}</label>
                </td>
                <td class="label">
                    <input type="checkbox"
                           id="db_create_user"
                           name="db_create_user"
                           value="on"
                           @if (!empty($me->vars->create_user)) checked @endif
                           @if($me->vars->install_noedit == 2 && $me->vars->create_user !== null) disabled @endif
                    >
                </td>
                <td class="comment">
                    {!! $me->langs->trans("CheckToCreateUser") !!}
                </td>
            </tr>

            <!-- Super access -->
            <tr class="hidesqlite hideroot">
                <td colspan="3" class="label"><br>
                    <h3>
                        <img class="valignmiddle inline-block paddingright"
                             src="{!! $me->config->main->url !!}/Templates/common/octicons/build/svg/shield.svg"
                             width="20" alt="webserver"> {!! $me->langs->trans("DatabaseSuperUserAccess") !!}
                    </h3>
                </td>
            </tr>

            <tr class="hidesqlite hideroot">
                <td class="label"><label for="db_user_root"><b>{!! $me->langs->trans("Login") !!}</b></label>
                </td>
                <td class="label">
                    <input type="text"
                           id="db_user_root"
                           name="db_user_root"
                           class="needroot"
                           value="{!! $me->vars->root_user !!}"
                           @if ($me->vars->install_noedit > 0 && !empty($me->force_install_databaserootlogin)) disabled @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("DatabaseRootLoginDescription") !!}
                    <!--
                        {!! '<br>' . $me->langs->trans("Examples") . ':<br>' !!}
                    <ul>
                        <li>root (Mysql)</li>
                        <li>postgres (PostgreSql)</li>
                    </ul>
-->
                </td>
            </tr>
            <tr class="hidesqlite hideroot">
                <td class="label"><label for="db_pass_root"><b>{!! $me->langs->trans("Password") !!}</b></label>
                </td>
                <td class="label">
                    <input type="password"
                           autocomplete="off"
                           id="db_pass_root"
                           name="db_pass_root"
                           class="needroot text-security"
                           value="{!! $me->vars->root_pass !!}"
                           @if ($me->vars->install_noedit > 0 && !empty($me->force_install_databaserootpass)) disabled
                    /*
                    May be removed by javascript*/ @endif
                    >
                </td>
                <td class="comment">{!! $me->langs->trans("KeepEmptyIfNoPassword") !!}
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        function init_needroot() {
            console.log("init_needroot install_noedit={!! $me->vars->install_noedit !!}");
            console.log(jQuery("#db_create_database").is(":checked"));
            console.log(jQuery("#db_create_user").is(":checked"));

            if (jQuery("#db_create_database").is(":checked") || jQuery("#db_create_user").is(":checked")) {
                console.log("init_needroot show root section");
                jQuery(".hideroot").show();
                <?php
                if (empty($me->vars->install_noedit)) { ?>
                jQuery(".needroot").removeAttr('disabled');
                <?php } ?>
            } else {
                console.log("init_needroot hide root section");
                jQuery(".hideroot").hide();
                jQuery(".needroot").prop('disabled', true);
            }
        }

        function checkDatabaseName(databasename) {
            if (databasename.match(/[;\.]/)) {
                return false;
            }
            return true;
        }

        function jscheckparam() {
            console.log("Click on jscheckparam");

            var ok = true;

            if (document.forminstall.main_dir.value == '') {
                ok = false;
                alert('{!! dol_escape_js($me->langs->transnoentities("ErrorFieldRequired", $me->langs->transnoentitiesnoconv("WebPagesDirectory"))) !!}');
            } else if (document.forminstall.main_data_dir.value == '') {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("ErrorFieldRequired", $me->langs->transnoentitiesnoconv("DocumentsDirectory"))) !!}');
            } else if (document.forminstall.main_url.value == '') {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("ErrorFieldRequired", $me->langs->transnoentitiesnoconv("URLRoot"))) !!}');
            } else if (document.forminstall.db_host.value == '') {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("ErrorFieldRequired", $me->langs->transnoentitiesnoconv("Server"))) !!}');
            } else if (document.forminstall.db_name.value == '') {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("ErrorFieldRequired", $me->langs->transnoentitiesnoconv("DatabaseName"))) !!}');
            } else if (!checkDatabaseName(document.forminstall.db_name.value)) {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("ErrorFieldCanNotContainSpecialCharacters", $me->langs->transnoentitiesnoconv("DatabaseName"))) !!}');
            }
            // If create database asked
            else if (document.forminstall.db_create_database.checked == true && (document.forminstall.db_user_root.value == '')) {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("YouAskToCreateDatabaseSoRootRequired")) !!}');
                init_needroot();
            }
            // If create user asked
            else if (document.forminstall.db_create_user.checked == true && (document.forminstall.db_user_root.value == '')) {
                ok = false;
                alert(' {!! dol_escape_js($me->langs->transnoentities("YouAskToCreateDatabaseUserSoRootRequired")) !!}');
                init_needroot();
            }

            return ok;
        }


        jQuery(document).ready(function () { // TODO Test $( window ).load(function() to see if the init_needroot work better after a back

            var dbtype = jQuery("#db_type");

            dbtype.change(function () {
                if (dbtype.val() == 'sqlite' || dbtype.val() == 'sqlite3') {
                    jQuery(".hidesqlite").hide();
                } else {
                    jQuery(".hidesqlite").show();
                }

                // Automatically set default database ports and admin user
                if (dbtype.val() == 'mysql' || dbtype.val() == 'mysqli') {
                    jQuery("#db_port").val(3306);
                    jQuery("#db_user_root").val('root');
                } else if (dbtype.val() == 'pgsql') {
                    jQuery("#db_port").val(5432);
                    jQuery("#db_user_root").val('postgres');
                } else if (dbtype.val() == 'mssql') {
                    jQuery("#db_port").val(1433);
                    jQuery("#db_user_root").val('sa');
                }

            });

            jQuery("#db_create_database").click(function () {
                console.log("click on db_create_database");
                init_needroot();
            });
            jQuery("#db_create_user").click(function () {
                console.log("click on db_create_user");
                init_needroot();
            });

            <?php if ($me->vars->install_noedit == 2 && empty($me->force_install_databasepass)) { ?>
            jQuery("#db_pass").focus();
            <?php } ?>

            let force_https = jQuery('#force_https');
            force_https.click(function () {
                let base_url = jQuery('#base_url');
                let text = base_url.val();
                if (force_https.prop('checked')) {
                    text = text.replace('http://', 'https://');
                } else {
                    text = text.replace('https://', 'http://');
                }
                base_url.val(text);
            });

            init_needroot();
        });
    </script>
    </tbody>
@endsection
