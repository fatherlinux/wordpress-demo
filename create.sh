#!/bin/bash
mkdir -p /srv/data/pv0001 /srv/data/pv0002
chcon -Rt svirt_sandbox_file_t /srv/data/pv000*
oc new-project wordpress
oc create -f wordpress-objects.yaml
