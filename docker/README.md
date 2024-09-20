# Project Alixar with Docker

This project uses Docker to create and manage the necessary containers for its operation. Below are the steps required
to build and run the containers.

## Prerequisites

Make sure you have the following components installed on your system:

- [Docker](https://docs.docker.com/get-docker/)

## Download or clone the Project

First, you need to get a copy of the project from GitHub. You can either download the project as a ZIP file and unzip it
or clone the repository using Git.

### Download as ZIP

1. Go to the GitHub repository page [Alixar](https://github.com/rsanjoseo/alixar).
2. Click the "Code" button.
3. Select "Download ZIP".
4. Unzip the downloaded file to your desired location.

### Clone the Repository

To clone the repository, use the following command:

```sh
git clone https://github.com/rsanjoseo/alixar.git
```

## Build the Containers

To build the containers from scratch without using the cache, use the following command:

```sh
cd docker
docker compose build --no-cache
```

This command will build the Docker images specified in the `docker-compose.yml` file without using the cache, ensuring
that updated versions of dependencies and packages are fetched.

## Bring Up the Containers

To bring up the containers and ensure they are recreated and orphans are removed, use the following command:

```sh
docker compose up --force-recreate --remove-orphans
```

Parameters:

- --force-recreate: Forces the recreation of containers even if there are no changes in their configuration.
- --remove-orphans: Removes containers that are not defined in the docker-compose.yml file.

## Access the PHP Container

To access a specific container, for example, a container named alixar_php, you can use the following command:

```sh
docker exec -it alixar_php bash
```

This command provides you with an interactive terminal inside the alixar_php container, allowing you to run commands
directly in the container's environment.

## Shut Down and Remove Containers

To shut down and remove all containers, networks, and volumes created by Docker Compose, use:

```sh
docker compose down
```

## Enjoy Alixar

Once the containers are up, you can test the code by simply accessing [http://localhost:8080](http://localhost:8080)
from your browser.