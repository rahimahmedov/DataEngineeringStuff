FROM centos:latest
WORKDIR /root
ARG HADOOP_HOME=/opt/hadoop
RUN yum -y --nogpg install java-1.8.0-openjdk wget tar zip \
    && mkdir -p $HADOOP_HOME \
    && wget https://www-eu.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz \
    && mv hadoop-3.2.1.tar.gz $HADOOP_HOME \
    && cd $HADOOP_HOME  && tar xvfz hadoop-3.2.1.tar.gz \
    && rm -f $HADOOP_HOME/hadoop-3.2.1.tar.gz \
    && mkdir /nn /snn /yarn /dn /shared
VOLUME /nn /snn /dn /yarn /shared
RUN mkdir -p /etc/hadoop/conf
COPY core-site.xml /etc/hadoop/conf
COPY hdfs-site.xml /etc/hadoop/conf
COPY yarn-site.xml /etc/hadoop/conf
COPY mapred-site.xml /etc/hadoop/conf
COPY start_hdfs.sh /usr/bin/
COPY start_yarn.sh /usr/bin/
COPY start_master.sh /usr/bin/
COPY start_worker.sh /usr/bin/
RUN chmod +x /usr/bin/start_hdfs.sh \
    && chmod +x /usr/bin/start_yarn.sh \
    && chmod +x /usr/bin/start_master.sh \
    && chmod +x /usr/bin/start_worker.sh
ENV HADOOP_CONF_DIR /etc/hadoop/conf
ENV HADOOP_HOME $HADOOP_HOME/hadoop-3.2.1
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV JAVA_HOME /etc/alternatives/jre_openjdk