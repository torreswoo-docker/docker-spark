## Pre-requisite

There should be a bridge network named as `hadoop` where hadoop cluster runs on.

```
$ docker network create -d bridge hadoop
```

## Run spark container in hadoop network

```
$ docker run -it --network hadoop --env-file hadoop.env sangwonl/hadoop-spark bash
```

## Run PySpark

```
$ cd /opt/spark
$ ./bin/pyspark --master yarn
```

