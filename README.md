# DataEngineeringStuff
Simple Hadoop playground on Docker containers. The project is not intended to be used in product, but rather for learning, testing and development purposes. The current cluster consist of 1 master and 3 worker nodes hadoop nodes, mysql database and client container. 
## Requirements
Build using Docker Desktop for Mac 2.1.0.3. 
## Building and running:
Use docker-compose to build and run containers:

    $> cd Containers/HadoopCluster/
    $> docker-compose -f compose.yml up -d
