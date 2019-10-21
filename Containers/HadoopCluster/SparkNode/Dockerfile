FROM hadoopbasenode:0.1-ra
MAINTAINER Rahim Ahmedov  <rahim.ahmedov@gmail.com>

WORKDIR /root

RUN wget https://www-eu.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-without-hadoop.tgz
RUN wget https://www-us.apache.org/dist/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
ls

RUN mkdir -p /opt/spark/ \
    && mv /root/spark-2.4.4-bin-without-hadoop.tgz /opt/spark \
    && cd /opt/spark \
    && tar xvfz spark-2.4.4-bin-without-hadoop.tgz \
    && rm -f spark-2.4.4-bin-without-hadoop.tgz


ENV SPARK_HOME=/opt/spark/spark-2.4.4-bin-without-hadoop
ENV YARN_CONF_DIR=$HADOOP_CONF_DIR
ENV PATH=$PATH:$SPARK_HOME/bin
RUN echo 'declare -x SPARK_DIST_CLASSPATH=`hadoop classpath`' > /etc/profile.d/spark_env.sh
