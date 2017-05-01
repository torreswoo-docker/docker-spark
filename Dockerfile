FROM sangwonl/hadoop-base:2.7.1

MAINTAINER Sangwon Lee <gamzabaw@gmail.com>

ENV SPARK_VERSION 2.1.0
ENV SPARK_URL http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VERSION-bin-hadoop2.7.tgz
RUN set -x \
    && curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && tar -xvf /tmp/spark.tgz -C /opt/ \
    && rm /tmp/spark.tgz \
    && mv /opt/spark-$SPARK_VERSION-bin-hadoop2.7 /opt/spark

ENV SPARK_HOME=/opt/spark

RUN cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
RUN curl -fSL http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar -o $SPARK_HOME/jars/hadoop-aws-2.7.3.jar \
    && curl -fSL http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar -o $SPARK_HOME/jars/aws-java-sdk-1.7.4.jar

WORKDIR /opt/spark

ENTRYPOINT ["/entrypoint.sh"]
