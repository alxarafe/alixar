# Plan de Migración de Dolibarr a Alixar (Alxarafe 0.1.1+)

## 1. Introducción
Este documento detalla el plan estratégico para clonar y migrar la funcionalidad de **Dolibarr** al nuevo framework **Alixar**, basado en **Alxarafe 0.1.1** y superior. El objetivo es modernizar la arquitectura, mejorar el rendimiento y simplificar el desarrollo utilizando componentes estándar de Laravel (Eloquent, Blade, Events).

## 2. Tecnologías Core
- **Framework**: Alxarafe v0.1.1.
- **PHP**: 8.5+.
- **Base de Datos**: MariaDB / MySQL.
- **ORM**: Illuminate Database (Eloquent).
- **Frontend**: Blade Templates + Vanilla CSS + TypeScript (arquitectura Zero-JS).

## 3. Fase 1: Preparación del Entorno
- [x] Limpieza del repositorio (mover `dolibarr` y `alixar` legacy a `tmp/`).
- [x] Configuración inicial de `.gitignore`.
- [ ] Verificación de dependencias en `composer.json` (Alxarafe 0.1.1).
- [ ] Configuración de contenedores Docker para desarrollo.

## 4. Fase 2: Análisis de Datos (Dolibarr)
Dolibarr utiliza un prefijo `llx_` para sus tablas. Las entidades críticas identificadas para la primera fase son:
- **Terceros (Société)**: `llx_societe` maps to `Modules/Alixar/Models/ThirdParty.php`.
- **Productos/Servicios**: `llx_product` maps to `Modules/Alixar/Models/Product.php`.
- **Facturación**: `llx_facture` y `llx_facturedet` maps to `Invoices` module.
- **Usuarios/Permisos**: `llx_user` maps to Alxarafe native Auth system.

## 5. Fase 3: Arquitectura de Módulos en Alixar
Se propone una estructura modular dentro de `Modules/`:
- `Modules/Core`: Funcionalidad base compartida.
- `Modules/ThirdParties`: Gestión de clientes, proveedores y contactos.
- `Modules/Inventory`: Gestión de productos, stock y almacenes.
- `Modules/Finance`: Facturación, pagos y presupuestos.

## 6. Fase 4: Estrategia de Migración de Datos (ETL)
Se desarrollarán scripts de migración (Seeders) que:
1. Conecten a la base de datos origen (Dolibarr).
2. Transformen los datos al esquema de Alixar (Eloquent).
3. Validen la integridad referencial.
4. Importen los datos en el nuevo sistema.

## 7. Fase 5: Desarrollo de Interfaz (UI)
- Utilización de `ResourceController` de Alxarafe para automatizar los CRUDs.
- Creación de templates Blade en `templates/` siguiendo la jerarquía de Alxarafe.
- Implementación de temas personalizados mediante el `ThemeManager`.

## 8. Próximos Pasos Inmediatos
1. Definir el esquema de base de datos inicial para `ThirdParties`.
2. Crear los primeros modelos Eloquent.
3. Configurar el sistema de autenticación de Alxarafe.
