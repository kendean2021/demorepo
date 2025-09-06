#!/bin/bash

# make sure /etc/hosts has:  <minikube ip>  myapp.local
# then run a quick load storm for ~2 minutes
URL=https://myapp.local
PARALLEL=30
DURATION=120

for i in $(seq $PARALLEL); do
  (end=$((SECONDS+DURATION)); while [ $SECONDS -lt $end ]; do curl -ks "$URL" >/dev/null; done) &
done
wait
