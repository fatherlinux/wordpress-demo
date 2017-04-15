#!/bin/bash

oc delete rc/wordpress rc/mysql pvc/claim-wp pvc/claim-mysql pv/pv0001 pv/pv0002 pv/pv0003 pv/pv0004
