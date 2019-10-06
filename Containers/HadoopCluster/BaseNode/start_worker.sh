#!/bin/bash


echo " >>>> Starting $1 service .... >>>>"
rm -f /tmp/hadoop-root-datanode.pid
rm -f /tmp/hadoop-root-nodemanager.pid
hdfs --daemon start datanode
yarn nodemanager
