<?php

use Alxarafe\Lib\Router;

// Alixar ERP Routes
Router::add('home', '/', 'Alixar.Dashboard.index');
Router::add('third_parties', '/third-parties', 'Alixar.ThirdParty.index');
Router::add('third_parties_save', '/third-parties/save', 'Alixar.ThirdParty.save');
Router::add('third_parties_delete', '/third-parties/delete', 'Alixar.ThirdParty.delete');

// Products and Services
Router::add('products', '/products', 'Alixar.Product.index');
Router::add('products_save', '/products/save', 'Alixar.Product.save');
Router::add('products_delete', '/products/delete', 'Alixar.Product.delete');

// Admin routes (Standard)
// Router::add('admin_dashboard', '/admin', 'Admin.Dashboard.index');
