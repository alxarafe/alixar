# Separación de Responsabilidades: Alxarafe vs Alixar

## Principio

> **Alxarafe** = Framework genérico. Cualquier app (ERP, CMS, tienda...) se beneficia.
> **Alixar** = Aplicación ERP. Funcionalidades específicas de un ERP de tipo Dolibarr.

---

## Lo que Alxarafe YA TIENE (v0.4.8)

| Funcionalidad | Controller/Servicio | Estado |
|---|---|---|
| Login/Logout/Sesión | `AuthController` | ✅ |
| CRUD Usuarios | `UserController` | ✅ |
| Roles | `RoleController` | ✅ |
| Perfil usuario | `ProfileController` | ✅ |
| Configuración global | `ConfigController` | ✅ |
| Migraciones BD | `MigrationController` | ✅ |
| Sistema de menús | `MenuManager` + `#[Menu]` | ✅ |
| Sincronización permisos | `PermissionSyncer` | ✅ |
| Notificaciones | `NotificationManager` | ✅ |
| Tabs, Panels, Fields | Componentes UI | ✅ |
| HasWorkflow (StateMachine) | Trait para modelos | ✅ |

## Lo que DEBERÍA estar en Alxarafe (genérico) → Solicitar

| Funcionalidad | Por qué es genérico | Estado |
|---|---|---|
| **Editor de diccionarios** | Cualquier app tiene tablas de referencia (`c_*`) | ❌ Solicitar |
| **Activación de módulos** | El framework ya descubre `Modules/`, falta UI on/off | ❌ Solicitar |
| **Servicio Email** | Enviar correos es genérico | ❌ Solicitar |
| **Log de auditoría** | Qué usuario hizo qué y cuándo | ❌ Solicitar |
| **Info del sistema** | PHP version, DB, memoria — útil para debug | ❌ Solicitar |
| **Grupos de usuarios** | Agrupar usuarios para permisos es genérico | ❌ Verificar si RoleController ya cubre |

## Lo que es EXCLUSIVO de Alixar (ERP)

| Funcionalidad | Por qué es específico del ERP |
|---|---|
| **Datos de empresa** | OrganizationController — campos de NIF, logo, forma jurídica |
| **Diccionarios concretos** | Países, provincias, IVA, incoterms, formas jurídicas → datos ERP |
| **Establecimientos** | Centros de trabajo — concepto ERP |
| **Multi-empresa** | Entidades múltiples — concepto ERP |
| **Máscaras de numeración** | CU{yy}-{0000} para facturas, etc. — configuración ERP |
| **Plantillas PDF** | Modelos Crocus/Sponge para factura/presupuesto |
| **Plantillas email ERP** | "Su factura está validada" — textos específicos |
| **Todos los módulos funcionales** | CRM, Ventas, Compras, Stock, Contabilidad, RRHH... |

---

## ¿Plan exhaustivo para el núcleo?

No hace falta un plan muy extenso. El núcleo de Alixar es pequeño si Alxarafe cubre lo genérico. Los ítems específicos de Alixar serían:

### Núcleo Alixar (a implementar)

| # | Qué | Depende de | Esfuerzo |
|---|---|---|---|
| 1 | Completar **OrganizationController** (empresa, logo, más campos) | Nada | 1 día |
| 2 | **DictionaryController** — CRUD genérico para poblar las `c_*` | 🔧 Solicitar a Alxarafe | 1-2 días |
| 3 | **Seeders** para diccionarios (países, IVA, etc. con datos españoles) | DictionaryCtrl | 1 día |
| 4 | Verificar que **Users/Roles/Permisos** existentes cubren necesidades | Alxarafe Auth | 1 día |
| 5 | **Dashboard** mejorado con widgets configurables | Nada | 2 días |
| 6 | **Config PDF/Numeración** por módulo | HasReference ya existe | 1 día |

**Total núcleo Alixar**: ~7-8 días laborables (si Alxarafe nos da el editor de diccionarios).

### Prompt para solicitar a Alxarafe

> 1. **Editor genérico de diccionarios**: Un ResourceController que reciba un modelo `c_*` como parámetro y genere CRUD automáticamente. Permitiría `?model=CCountry` → lista/edición de países.
> 2. **Activación de módulos UI**: El ModuleManager ya descubre Modules/, falta una pantalla donde el admin pueda activar/desactivar módulos y una constante `module_enabled_{name}` en config.
> 3. **Servicio Email básico**: Configuración SMTP + `EmailService::send($to, $subject, $body, $template?)`.
