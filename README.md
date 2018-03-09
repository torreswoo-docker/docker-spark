

## Pre-requisite
- https://github.com/torreswoo/docker-hadoop-cluster

## spec
- Hadoop 2.7.1
- HDFS
- YARN
- Spark 2.1.0
- Python 2.7.12
- pySpark

## start docker hadoop cluster with spark

01. There should be a bridge network named as `hadoop` where hadoop cluster runs on.
```
$ docker network create -d bridge hadoop
```

02. start hadoop cluster
```
$ docker-compose -f docker-compose-local.yml up
```

03. check hadoop.env
- check port namenode / resourcemanager

04. Run pyspark container in hadoop network
```
$ docker run -it --network hadoop --env-file hadoop.env sangwonl/hadoop-spark:2.1.0 ./bin/pyspark --master yarn
```
