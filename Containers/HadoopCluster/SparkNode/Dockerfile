FROM hadoopclientnode:0.1-ra
MAINTAINER Rahim Ahmedov  <rahim.ahmedov@gmail.com>

WORKDIR /root

RUN wget https://www-eu.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-without-hadoop.tgz
RUN wget https://www-us.apache.org/dist/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz

RUN mkdir -p /opt/spark/ \
    && mv /root/spark-2.4.4-bin-without-hadoop.tgz /opt/spark \
    && cd /opt/spark \
    && tar xvfz spark-2.4.4-bin-without-hadoop.tgz \
    && rm -f spark-2.4.4-bin-without-hadoop.tgz

RUN mkdir -p /opt/hive/ \
    && mv /root/apache-hive-3.1.2-bin.tar.gz /opt/hive \
    && cd /opt/hive/ \
    && tar xvfz apache-hive-3.1.2-bin.tar.gz \
    && rm -f apache-hive-3.1.2-bin.tar.gz

ENV SPARK_HOME=/opt/spark/spark-2.4.4-bin-without-hadoop
ENV YARN_CONF_DIR=$HADOOP_CONF_DIR
ENV HIVE_HOME=/opt/hive/apache-hive-3.1.2-bin
ENV PATH=$PATH:$SPARK_HOME/bin:$HIVE_HOME/bin
RUN echo 'declare -x SPARK_DIST_CLASSPATH=`hadoop classpath`' > /etc/profile.d/spark_env.sh
RUN rm $HIVE_HOME/lib/guava-19.0.jar \
    && cp $FLUME_HOME/lib/guava-28.1-jre.jar $HIVE_HOME/lib \
    && cp $SQOOP_HOME/lib/mysql-connector-java-8.0.17.jar $HIVE_HOME/lib

COPY hive-site.xml $HIVE_HOME/conf
ENV HIVE_CONF_DIR=$HIVE_HOME/conf