# Running the Environment
Everything can be run using `docker compose`. The environment is separated into multiple parts.

1. Polaris: To Use the official [Apache Polaris Iceberg Catalog](https://github.com/apache/polaris/)
2. Spark Ecosystem: Uses Spark, Iceberg Jars for Spark 4.x (WIP)
3. Kafka and Bufstream environments (WIP)

# Polaris Environment
> The `./polaris/docker-compose.yml` is a direct copy of the getting-started/minio/docker-compose.yml from https://github.com/apache/polaris/tree/main/getting-started/minio

## Running Spark alongside Polaris
1. Create the `iceberg` docker network.
   ```bash
   docker network create iceberg
   ```
2. Spin up the Polaris docker

   ```bash
   docker compose \
   -f ./polaris/docker-compose.yml up \
   --remove-orphans 
   ```
   

2. Spin up the Iceberg Spark environment
   ```bash
   docker compose \
     -f ./spark/docker-compose.yml up \
     --remove-orphans 
   ```
   
## Nuclear Option (to reset and rebuild everything)
> Note: This will remove all containers that are stopped. 
```bash
docker container prune
```