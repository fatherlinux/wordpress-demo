#!/bin/bash

dir=/exports/data/

for i in pv0001 pv0002 pv0003 pv0004
do
	mkdir -p "$dir/$i
	chmod 777 $dir/$i
	chcon -Rt svirt_sandbox_file_t $dir/$i"
done
