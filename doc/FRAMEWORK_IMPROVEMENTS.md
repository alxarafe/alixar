# Mejoras Sugeridas para Alxarafe Framework

Durante la migración de Dolibarr a Alixar, se han detectado los siguientes puntos de mejora en el core de Alxarafe (v0.4.4):

## 1. Inconsistencia en Resolución de Temas
**Problema**: `WebDispatcher` ignora la constante global `THEME_SKIN` si ya ha sido definida antes de su ejecución. Además, recalcula el tema buscando en cookies y sesión de forma redundante pero ligeramente diferente a como se hace en el `index.php` de la aplicación.
**Sugerencia**: `WebDispatcher::run` debería comprobar si `THEME_SKIN` ya está definida y usarla como prioridad absoluta.

## 2. Divergencia en Rutas de Plantillas
**Problema**: `ViewController::__construct` busca temas en `APP_PATH/themes/NAME/templates/`, mientras que `WebDispatcher::run` (a través de `setTemplatesPath`) inyecta `APP_PATH/templates/themes/NAME/`.
**Sugerencia**: Estandarizar una única ruta para los temas (preferiblemente la de `WebDispatcher` que es la más común en despliegues modernos).

## 3. Carga de Configuración en CLI
**Problema**: `Config::getConfigFilename()` depende de `APP_PATH` o `BASE_PATH`. En scripts de consola (`run_migrations.php`), si no se definen estas constantes manualmente antes de cargar el autoload, el sistema falla al no encontrar el `config.json` en la raíz.
**Sugerencia**: Añadir una lógica de búsqueda ascendente desde el script ejecutado hasta encontrar la raíz del proyecto.

## 4. Trait HasReference Desaparecido
**Problema**: Algunos modelos dependían de `Alxarafe\Base\Model\Trait\HasReference`, el cual parece haber sido eliminado o movido en la v0.4.4 sin un reemplazo directo evidente para la generación de máscaras tipo Dolibarr.
**Sugerencia**: Reincorporar un trait estándar para gestión de referencias numéricas/máscaras.
