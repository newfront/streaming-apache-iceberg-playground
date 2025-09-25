#!/bin/bash

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='lab --ip=0.0.0.0'
export ICEBERG_SPARK_VERSION='1.10.0'
export ICEBERG_PACKAGE_VERSION=iceberg-spark-runtime-4.0_2.13:${ICEBERG_SPARK_VERSION}

$SPARK_HOME/bin/pyspark \
  --packages org.apache.iceberg:${ICEBERG_PACKAGE_VERSION},org.apache.iceberg:iceberg-aws-bundle:${ICEBERG_SPARK_VERSION} \
  --conf "spark.driver.extraJavaOptions=-Divy.cache.dir=/tmp -Divy.home=/tmp -Dio.netty.tryReflectionSetAccessible=true" \
  --conf "spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions" \
  --conf "spark.sql.catalog.lakekeeper=org.apache.iceberg.spark.SparkCatalog" \
  --conf "spark.sql.catalog.lakekeeper.type=rest" \
  --conf "spark.sql.catalog.lakekeeper.uri=http://lakekeeper:8181/api/catalog" \
  --conf "spark.sql.catalog.lakekeeper.warehouse=demo" \
  --conf "spark.sql.catalog.lakekeeper.io-impl=org.apache.iceberg.aws.s3.S3FileIO" \
  --conf "spark.sql.defaultCatalog=lakekeeper"
