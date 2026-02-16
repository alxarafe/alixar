<?php

use Alxarafe\Lib\Router;

// Alixar ERP Routes
Router::add('home', '/', 'Alixar.Dashboard.index');
Router::add('terceros', '/terceros', 'Alixar.Societe.index');
Router::add('terceros_save', '/terceros/save', 'Alixar.Societe.save');
Router::add('terceros_delete', '/terceros/delete', 'Alixar.Societe.delete');

// Admin routes (Standard)
// Router::add('admin_dashboard', '/admin', 'Admin.Dashboard.index');
