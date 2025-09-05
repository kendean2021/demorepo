#!/bin/bash

kubectl apply -f certificate.yaml
kubectl wait --for=condition=ready certificate/myapp-cert --timeout=120s
kubectl get secret myapp-tls -o yaml | grep -E 'tls\.crt|tls\.key'
