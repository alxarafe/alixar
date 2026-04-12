# Gestión de Docker en Alixar

Este documento describe cómo arrancar y parar los contenedores de Docker para las diferentes tareas del proyecto.

## Modos de Ejecución

Existen dos entornos de Docker independientes en este proyecto:

### 1. Entorno de Desarrollo y Depuración (Estándar)
Este entorno levanta la aplicación Alixar (PHP + NGINX + MariaDB) para su uso normal o depuración.

- **Configuración:** `docker-compose.yml`
- **Script de arranque:** `./bin/docker_start.sh`
- **Script de parada:** `./bin/docker_stop.sh`
- **Puertos:**
  - HTTP: `8083` (configurable en `.env` vía `HTTP_PORT`)
  - PhpMyAdmin: `9083` (configurable en `.env` vía `PHPMYADMIN_PORT`)
  - MariaDB: `3401` (configurable en `.env` vía `MARIADB_PORT`)

### 2. Entorno de Comparación y Test (Aislado)
Este entorno es ideal para ejecutar tests automatizados contra Dolibarr o realizar **pruebas manuales** en una base de datos totalmente independiente de la de desarrollo/producción.

- **Aislamiento Total:** Utiliza su propia red (`apitest_network`), sus propios volúmenes de datos (`apitest_db_data`) y una base de datos distinta (`apitest_db`). Esto garantiza que los tests nunca ensucien tus datos de desarrollo.
- **Acceso HTTP:** Al igual que en desarrollo, puedes acceder a la API de test vía HTTP para realizar comprobaciones visuales o manuales.
- **Script principal:** `./bin/api_compare.sh`
- **Variables necesarias:**
  - `DOLIBARR_PATH`: Ruta al código de Dolibarr (opcional si solo quieres probar Alixar en el entorno de test).
- **Puertos:**
  - Alixar API (Test): `8091` (vía `APITEST_ALIXAR_PORT`)
  - Dolibarr API: `8090` (vía `APITEST_DOLIBARR_PORT`)
  - PhpMyAdmin (Test): `9090` (vía `APITEST_PHPMYADMIN_PORT`)
  - MariaDB (Test): `3490` (vía `APITEST_DB_PORT`)

---

## Pruebas Manuales en el Entorno de Test

Es altamente conveniente usar el entorno de test para pruebas manuales antes de ejecutar la suite automatizada. Para ello:

1. **Arranca el entorno:**
   ```bash
   ./bin/api_compare.sh up
   ```
   *Nota: Si no tienes Dolibarr configurado, el script arrancará únicamente Alixar y la base de datos de test.*

2. **Accede vía Navegador/Bruno/Curl:**
   - La API de Alixar estará disponible en: `http://localhost:8091`
   - Puedes ver la base de datos de test en: `http://localhost:9090`

3. **Independencia de Datos:**
   Cualquier registro que crees aquí **no aparecerá** en tu entorno de desarrollo estándar (`localhost:8083`).

---

## Configuración de DOLIBARR_PATH

Para los tests de comparación, se requiere tener el código de Dolibarr (preferiblemente el fork `alxarafe/dolibarr`).

1. Define la ruta en tu archivo `.env`:
   ```env
   DOLIBARR_PATH=../dolibarr
   ```
2. Si la variable no existe o la ruta es incorrecta, los comandos de `./bin/api_compare.sh` informarán de que es necesaria para proceder.

---

## Verificación de Repositorios

Antes de arrancar, asegúrate de que los repositorios necesarios están presentes:

- **Alixar (este repo):** Ya estás en él.
- **Dolibarr (opcional para tests):** Debe estar en la ruta especificada por `DOLIBARR_PATH`.

Si necesitas clonar Dolibarr:
```bash
cd ..
git clone git@github.com:alxarafe/dolibarr.git
```

## Comandos Útiles

### Ver estado de los contenedores
```bash
docker ps
```

### Ver logs
```bash
docker compose logs -f [nombre_servicio]
```

### Limpiar volúmenes (Reset total)
Para el entorno de desarrollo:
```bash
docker compose down -v
```
Para el entorno de tests:
```bash
./bin/api_compare.sh reset
```
