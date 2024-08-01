docker compose build --no-cache

docker compose up --force-recreate --remove-orphans

docker exec -it alixar_php bash