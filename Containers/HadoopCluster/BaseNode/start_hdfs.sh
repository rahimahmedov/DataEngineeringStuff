#!/bin/bash

if [ $# -eq 2 ] && [ $2 == "--reset" ]
then
    case $1 in
        namenode )
            echo " >>>> Formatting name node .... >>>>"
            hdfs namenode -format -force
            ;;
        datanode )
            echo " >>>> deleting data  .... >>>>"
            rm -rf /dn/*
            ;;
    esac
fi

echo " >>>> Starting $1 service .... >>>>"
rm -f /tmp/hadoop-root-$1.pid
if ! [ -f /nn/current/VERSION ] && [ $1 == namenode ]
then
    hdfs namenode -format -force
fi
hdfs --daemon start $1
