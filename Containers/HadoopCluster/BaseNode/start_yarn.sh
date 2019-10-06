#!/bin/bash

echo " >>>> Starting $1 service .... >>>>"
rm -f /tmp/hadoop-root-$1.pid
yarn --daemon start $1
