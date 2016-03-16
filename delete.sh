#!/bin/bash
oc delete pv pv0001 pv0002
oc delete project wordpress
rm -rf /srv/data/pv000*/*
ls /srv/data/pv000*
