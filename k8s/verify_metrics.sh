#!/bin/bash

# Deployed and ready?
kubectl -n kube-system get deploy metrics-server
kubectl -n kube-system get pods -l k8s-app=metrics-server

# Any obvious errors?
kubectl -n kube-system logs deploy/metrics-server --tail=80

# Do we get metrics at all?
kubectl top nodes
kubectl top pods -A | head



