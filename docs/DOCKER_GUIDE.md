# Guía de Entornos Docker en Alixar

Este documento detalla los diferentes contenedores y entornos Docker disponibles en el proyecto Alixar. Se definen dos configuraciones principales: una para el desarrollo general/producción simulada y otra específica para las pruebas de compatibilidad de la API contra Dolibarr.

## 1. Entorno de Desarrollo (Predeterminado)

Esta es la configuración estándar para trabajar en Alixar, que levanta el entorno completo incluyendo el backend PHP, base de datos MariaDB, servidor Nginx y el frontend de Vite.

**Archivo de configuración:** `docker-compose.yml`

### ¿Cómo arrancarlo?

La forma recomendada es utilizar los scripts de automatización situados en la carpeta `bin/`, que gestionan las variables de entorno y verifican el estado:

```bash
./bin/docker_start.sh
```

Si prefieres usar los comandos nativos de Docker, utiliza el comando moderno y estandarizado:
```bash
docker compose up -d
```
> [!NOTE]
> Evita el uso del comando antiguo `docker-compose` (con guion), ya que está en desuso y puede no estar instalado en sistemas modernos. Si recibes un error tipo "command not found", es probable que necesites instalar el plugin `docker-compose-plugin` o usar simplemente los scripts de `bin/`.

### Contenedores y Servicios:

- **`alixar_db`**: Base de datos MariaDB 10.11. El esquema de datos inicial puede inicializarse usando las migraciones de PHP (`./bin/run_migrations.sh`).
- **`alixar_php`**: Backend PHP con la configuración necesaria para ejecutar la API Hexagonal y acceder a la BD localmente. Este contenedor tiene montado el volumen actual (`.:/var/www/html`) para recarga en vivo del código backend.
- **`alixar_nginx`**: Servidor proxy inverso que atiende las peticiones HTTP (puerto definido por `HTTP_PORT` en el archivo `.env`) y las dirige al socket de PHP-FPM y configuraciones estáticas.
- **`alixar_phpmyadmin`**: Herramienta de visualización de base de datos disponible en el puerto `PHPMYADMIN_PORT` (por defecto suele ser 8080).
- **`alixar_frontend`**: Entorno en Node.js 20 ejecutando Vue 3 mediante Vite. Ejecuta automáticamente `npm run dev -- --host 0.0.0.0` y expone el Frontend Headless en el puerto **5173**.

---

## 3. Scripts de Utilidad en `bin/`

Para facilitar la interacción con los contenedores sin tener que recordar comandos complejos, dispones de:

- **`./bin/docker_start.sh`**: Arranca todo el ecosistema (Nginx, PHP, DB, Frontend, PMA).
- **`./bin/docker_stop.sh`**: Detiene los servicios.
- **`./bin/check_status.sh`**: Muestra el estado de salud de todos los contenedores y los puertos asignados.
- **`./bin/run_migrations.sh`**: Ejecuta las migraciones estructurales dentro del contenedor PHP.

---

## 2. Entorno de Testing / Testeo de Compatibilidad de la API

La finalidad principal de Alixar era desvincularse progresivamente del núcleo legado de Dolibarr, alcanzando a su vez el 100% de la paridad en la lógica de negocio y las estructuras API dictadas por Dolibarr.

Para validar de forma automatizada que las respuestas de Alixar coincidan estructural y semánticamente con las del Dolibarr clásico, se provee de un segundo archivo Docker Compose.

**Archivo de configuración:** `docker-compose.api-test.yml`

### ¿Cómo verificar la compatibilidad con Dolibarr?

Este entorno arranca **dos instancias simultáneas** y completamente independientes de backend (Dolibarr legado y Alixar Core API) contra una **misma base de datos temporal**.

1. **Prerrequisito:** Debes tener el fork de Dolibarr clonado en la carpeta superior (`../dolibarr`), o de forma equivalente, configurado en las variables de entorno.
2. **Levantar el entorno de test:**
   Usa el script de Bash diseñado explícitamente para abstraer la carga del test suite:
   ```bash
   ./bin/api_compare.sh up
   ```
3. **Ejecutar los Tests:**
   Esto enviará peticiones a los contenedores y comparará las divergencias en la Payload JSON.
   ```bash
   ./bin/api_compare.sh test
   ```
4. **Actualizar el Fork para reflejar los últimos cambios de Dolibarr:**
   ```bash
   ./bin/api_compare.sh update
   ```
5. **Apagar y limpiar el entorno de test:**
   ```bash
   ./bin/api_compare.sh down
   ```

### Puertos en el modo Test:

| Servicio | URL / Puerto | Descripción |
| :--- | :--- | :--- |
| **Dolibarr (Legacy)** | `http://localhost:8090` | API Rest expuesta por la versión clásica de Dolibarr. |
| **Alixar API (Hexagonal)** | `http://localhost:8091` | Nuestra API implementada independientemente con Hexagonal Architecture. |
| **PhpMyAdmin (Test DB)** | `http://localhost:9090` | Visualizador para la BD temporal `apitest_db`. |
| **MariaDB** | `localhost:3490` | Base de datos accesible externamente. |

> [!WARNING]
> Nunca uses la BD de `apitest_db` para almacenar datos reales o de desarrollo normal, está diseñada para ser destruida o alterada indiscriminadamente durante la suite de pruebas cruzadas (`api_compare.sh test`).
