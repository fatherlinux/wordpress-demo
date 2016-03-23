#!/bin/bash

dir=/srv/data

oc delete pv pv0001 pv0002 pv0003 pv0004
oc delete project wordpress
for i in `oc get nodes | awk '{print $1}' | grep -v ^NAME$`
do
	echo "Host: $i"
	ssh -q root@$i rm -rf $dir/pv000*
	ssh -q root@$i "ls -alhZ $dir"
	ssh -q root@$i "docker rm `docker ps --no-trunc -a -q`"
done
