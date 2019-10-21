# DataEngineeringStuff
Simple Hadoop playground on Docker containers. The project is not intended to be used in product, but rather for learning, testing and development purposes. The current cluster consist of 1 master and 3 worker nodes hadoop nodes, mysql database and client container. 
## Requirements
Build using Docker Desktop for Mac 2.1.0.3. 
## Building and running:
Use docker-compose to build and run containers:

    $> cd Containers/HadoopCluster/
    $> docker-compose -f compose.yml up -d

## Containers
Docker compose will build and run following containers:

- masternode: Hadoop master node - Namenode server, Resource manager server, Secondary namenode server
- workernode[1-3]: Hadoop worker nodes - HDFS data node, YARN node manager
- hadoopclient: Hadoop client container, contains HDFS/Hadoop client, SQOOP and FLUME 
- mysqldb: MYSQL DB for SQOOP tests and Hive Metastore (Hive Metastore currently not implemented yet)
- sparknode: Spark client and Hive Server (Hive Server not implemented yet) container

## Volumes
In order to proper setup environment following container volumes should be set up

 - volumes/dbstore:/var/lib/mysql:  mysql database storage volume
 - volumes/masternode/nn:/nn:       master node's namenode directory
 - volumes/masternode/snn:/snn:     master node's secondary namenode directory
 - volumes/workernode[1-3]/dn:/dn:      worker node's data node directory
 - volumes/workernode[1-3]/yarn:/yarn:  worker node's yarn directory
 - volumes/shared:/shared:          shared directory for hadoop client container