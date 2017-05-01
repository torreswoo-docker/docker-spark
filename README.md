## Pre-requisite

There should be a bridge network named as `hadoop` where hadoop cluster runs on.

```
$ docker network create -d bridge hadoop
```

## Run pyspark container in hadoop network

```
$ docker run -it --network hadoop --env-file hadoop.env sangwonl/hadoop-spark ./bin/pyspark --master yarn
```
