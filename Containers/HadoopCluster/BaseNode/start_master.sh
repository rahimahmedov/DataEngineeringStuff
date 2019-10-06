#!/bin/bash

echo " >>>> Starting $1 service .... >>>>"
rm -f /tmp/hadoop-root-namenode.pid
rm -f /tmp/hadoop-root-secondarynamenode.pid
rm -f /tmp/hadoop-root-resourcemanager.pid
if ! [ -f /nn/current/VERSION ]
then
    hdfs namenode -format -force
fi
hdfs --daemon start namenode
hdfs --daemon start secondarynamenode
yarn resourcemanager
