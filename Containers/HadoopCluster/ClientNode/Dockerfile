FROM hadoopbasenode:0.1-ra
MAINTAINER Rahim Ahmedov  <rahim.ahmedov@gmail.com>
WORKDIR /root
RUN yum  -y --nogpg install mysql java-1.8.0-openjdk-devel which telnet
RUN wget https://www-eu.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz \
    && wget https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar \
    && wget https://www-eu.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz \
    && wget https://repo1.maven.org/maven2/com/google/guava/guava/28.1-jre/guava-28.1-jre.jar
RUN mkdir -p /opt/sqoop  \
    && mv sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz /opt/sqoop \
    && cd /opt/sqoop/ \
    && tar xvfz sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz \
    && rm -f sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
RUN mkdir -p /opt/flume \
    && mv apache-flume-1.9.0-bin.tar.gz /opt/flume \
    && cd /opt/flume \
    && tar xvfz apache-flume-1.9.0-bin.tar.gz \
    && rm -f apache-flume-1.9.0-bin.tar.gz
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_YARN_HOME=$HADOOP_HOME
ENV SQOOP_HOME=/opt/sqoop/sqoop-1.4.7.bin__hadoop-2.6.0
ENV FLUME_HOME=/opt/flume/apache-flume-1.9.0-bin
ENV PATH=$PATH:$SQOOP_HOME/bin:$FLUME_HOME/bin
RUN mv /root/commons-lang-2.6.jar $SQOOP_HOME/lib/
RUN mv /root/guava-28.1-jre.jar $FLUME_HOME/lib \
    && rm $FLUME_HOME/lib/guava-11.0.2.jar
COPY mysql-connector-java-8.0.17.jar $SQOOP_HOME/lib/


