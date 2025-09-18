# streaming-apache-iceberg-playground
This environment is intended to teach data engineers and data practitioners the secrets to structured iceberg streaming

## Runtime Notes

We'll need to spin up the **Polaris** stack to have the Iceberg REST catalog available.

~~~bash
docker compose \
  -f docker/polaris/docker-compose.yml up \
  --remove-orphans
~~~