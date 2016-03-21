#!/bin/bash

dir=/srv/data

oc delete pv pv0001 pv0002 pv0003 pv0004
oc delete project wordpress
for i in `oc get nodes | awk '{print $1}' | grep -v ^NAME$`
do
	ssh -q root@$i rm -rf $dir/pv000*
	echo "Host: $i"; ssh -q root@$i "ls -alhZ $dir"
done

