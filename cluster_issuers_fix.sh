#!/bin/bash

# install cert-manager (includes CRDs)
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl -n cert-manager rollout status deploy/cert-manager --timeout=120s
kubectl -n cert-manager rollout status deploy/cert-manager-webhook --timeout=120s
kubectl -n cert-manager rollout status deploy/cert-manager-cainjector --timeout=120s

# now apply issuer & cert
kubectl apply -f k8s/clusterissuer.yaml
kubectl apply -f k8s/certificate.yaml

# verify
kubectl get clusterissuer
kubectl describe certificate myapp-cert
