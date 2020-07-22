#!/bin/bash

cd ~/DO280/labs/comprehensive-review/

echo "Creating famous-quotes database"
MYPOD=$(oc get pods -l app=mysql -o template --template '{{range .items}}{{.metadata.name}}{{end}}')

oc exec ${MYPOD} -- /opt/rh/rh-mysql57/root/usr/bin/mysql -u root -e 'CREATE DATABASE defaultdb'

echo "Deploying famous-quotes application"

oc create -f famous-quotes.yaml
