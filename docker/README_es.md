# Uso de docker con el proyecto Alixar

Este proyecto utiliza Docker para crear y gestionar los contenedores necesarios para su funcionamiento. A continuación,
se detallan los pasos necesarios para construir y ejecutar los contenedores.

## Prerrequisitos

Asegúrate de tener instalado Docker en tu sistema:

- [Docker](https://docs.docker.com/get-docker/)

## Descargue o clone el proyecto

En primer lugar, necesita descargar o clonar una copia del proyecto desde GitHub.

### Descargar el archivo ZIP

1. Vaya al repositorio de [Alixar](https://github.com/rsanjoseo/alixar) en GitHub.
2. Pulse en el botón "Code".
3. Pulse en "Download ZIP".
4. Descomprima el archivo que ha descargado en una carpeta de su ordenador.

### Clonar el repositorio

Para clonar el repositorio, cree y acceda a la carpeta donde desea clonar el proyecto y escriba el siguiente comando:

```sh
git clone https://github.com/rsanjoseo/alixar.git
```

## Construir los Contenedores

Para construir los contenedores desde cero, sin utilizar la caché, utiliza el siguiente comando:

```sh
cd docker
docker compose build --no-cache
```

Este comando construirá las imágenes Docker especificadas en el archivo `docker-compose.yml` sin utilizar la caché,
asegurando que se obtengan versiones actualizadas de las dependencias y paquetes.

## Levantar los Contenedores

Para levantar los contenedores y asegurarte de que se recrean y eliminen los huérfanos, utiliza el siguiente comando:

```sh
docker compose up --force-recreate --remove-orphans
```

Parámetros:

- --force-recreate: Fuerza la recreación de los contenedores incluso si no ha habido cambios en su configuración.
- --remove-orphans: Elimina los contenedores que no están definidos en el archivo docker-compose.yml.

## Acceder al Contenedor PHP

Para acceder a un contenedor específico, por ejemplo, un contenedor llamado alixar_php, puedes usar el siguiente
comando:

```sh
docker exec -it alixar_php bash
```

Este comando te proporciona una terminal interactiva dentro del contenedor alixar_php, permitiéndote ejecutar comandos
directamente en el entorno del contenedor.

## Apagar y Eliminar los Contenedores

Para apagar y eliminar todos los contenedores, redes y volúmenes creados por Docker Compose, utiliza:

```sh
docker compose down
```

## Disfrute de Alixar

Una vez levantados los contenedores, puede probar el código con tan sólo acceder desde su navegador
a [http://localhost:8080](http://localhost:8080).  