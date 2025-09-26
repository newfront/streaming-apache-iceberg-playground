# Streaming Iceberg
> Note: Runs Lakekeeper without Authentication and Authorization (unprotected). 
The example contains Jupyter with Spark as the query engine, Minio as storage and Lakekeeper connected to a Postgres database.

To run the demo for yourself, do the following:

1. Read the [README.md](docker/lakekeeper/datasets/ecomm_raw/README.md) and download the `2019-Oct.csv` and `2019-Nov.csv` reference datasets.

2. Then Run the following command to get started.
```bash
cd docker/lakekeeper &&
docker network ls | grep -q iceberg || docker network create iceberg &&
docker compose up
```

Now open your Browser:
* Jupyter: [http://localhost:8888](http://localhost:8888)
* Lakekeeper UI: [http://localhost:8181](http://localhost:8181)
* Swagger UI: [http://localhost:8181/swagger-ui/#/](http://localhost:8181/swagger-ui/#/)

3. From the **Jupyter** environment, open up the [first_steps-iceberg](docker/lakekeeper/notebooks/first_steps-iceberg.ipynb) notebook and follow the directions (via the Markdown blocks).

---

## Fresh Start. Nuclear Option
> If things don't seem to be going well and you want to restart with a "very" clean docker state
> Warning: The `docker container prune` will remove all stopped containers. So if you rely on a lot of expensive containers, this would mean you'll have a lot of new images to fetch
```bash
docker compose down && 
docker container prune && 
docker network rm iceberg
```

Then just run the `bash command` from Step 2 again.

## Thanks to the Lakekeeper Project
> This example project works because of how simple their iceberg rest catalog is to use
* https://github.com/lakekeeper/lakekeeper
