#!/bin/bash

kubectl apply -f clusterissuer.yaml
kubectl get clusterissuer
kubectl describe clusterissuer selfsigned-issuer

