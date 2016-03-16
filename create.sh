#!/bin/bash
oc new-project wordpress
oc create -f wordpress-objects.yaml
