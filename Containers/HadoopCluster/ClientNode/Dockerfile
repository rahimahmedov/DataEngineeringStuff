FROM hadoopbasenode:0.1-ra
WORKDIR /root
RUN yum  -y --nogpg install mysql
RUN wget https://www-eu.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.tar.gz
RUN mkdir -p /opt/sqoop  \
    && mv sqoop-1.4.7.tar.gz /opt/sqoop \
    && tar xvfz /opt/sqoop/sqoop-1.4.7.tar.gz
ENV PATH=$PATH:/opt/sqoop/sqoop-1.4.7/bin
