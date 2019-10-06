FROM centos:latest
WORKDIR /root
RUN yum -y --nogpg install java-1.8.0-openjdk wget tar zip
ARG HADOOP_HOME=/opt/hadoop
RUN mkdir -p $HADOOP_HOME
RUN wget https://www-eu.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz
RUN mv hadoop-3.2.1.tar.gz $HADOOP_HOME
RUN cd $HADOOP_HOME  && tar xvfz hadoop-3.2.1.tar.gz
RUN mkdir /nn /snn /yarn /dn /shared
VOLUME /nn /snn /dn /yarn /shared
RUN mkdir -p /etc/hadoop/conf
COPY core-site.xml /etc/hadoop/conf
COPY hdfs-site.xml /etc/hadoop/conf
COPY yarn-site.xml /etc/hadoop/conf
COPY start_hdfs.sh /usr/bin/
RUN chmod +x /usr/bin/start_hdfs.sh
COPY start_yarn.sh /usr/bin/
RUN chmod +x /usr/bin/start_yarn.sh
COPY start_master.sh /usr/bin/
RUN chmod +x /usr/bin/start_master.sh
COPY start_worker.sh /usr/bin/
RUN chmod +x /usr/bin/start_worker.sh
ENV HADOOP_CONF_DIR /etc/hadoop/conf
ENV HADOOP_HOME $HADOOP_HOME/hadoop-3.2.1
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV JAVA_HOME /etc/alternatives/jre_openjdk