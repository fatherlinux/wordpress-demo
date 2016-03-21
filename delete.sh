#!/bin/bash
oc delete pv pv0001 pv0002 pv0003 pv0004
oc delete project wordpress
for i in `oc get nodes | awk '{print $1}' | grep -v ^NAME$`
do
	ssh root@$i rm -rf $dir/pv000*
done

