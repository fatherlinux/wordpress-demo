#!/bin/bash

if [ "$1" == "" ]
then
	echo "Please specifiy a yaml or json file. Example: ./create.sh wordpress-objects.yaml"
	exit
fi

dir="/srv/data"

for i in `oc get nodes | awk '{print $1}' | grep node0`
do
	echo "Node: $i"
	for j in pv0001 pv0002 pv0003 pv0004
	do
		ssh -q root@$i mkdir -p "$dir/$j && \
		               chmod 777 $dir/$j && \
		               chcon -Rt svirt_sandbox_file_t $dir/$j"
	done
	ssh -q root@$i "ls -alhZ $dir/"
done

# First create the persistent volumes:
oc create -f persistent-volumes.yaml
oc new-project wordpress
oc create -f $1
