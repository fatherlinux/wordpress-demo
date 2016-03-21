#!/bin/bash

dir="/srv/data"

for i in `oc get nodes | awk '{print $1}' | grep -v ^NAME$`
do
	for j in pv0001 pv0002 pv0003 pv0004
	do
		ssh root@$i mkdir -p $dir/$j
		ssh root@$i chmod 777 $dir/$j
		ssh root@$i chcon -Rt svirt_sandbox_file_t $dir/$j
	done
done
oc new-project wordpress
oc create -f wordpress-objects.yaml
