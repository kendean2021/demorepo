#!/bin/bash

kubectl get -n "$NS" configmap myapp-config
kubectl get -n "$NS" secret myapp-secrets

POD=$(kubectl get pods -n "$NS" -l app=myapp -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n "$NS" "$POD" -- printenv APP_MESSAGE
kubectl exec -n "$NS" "$POD" -- sh -lc '[ -n "$SECRET_TOKEN" ] && echo "SECRET_TOKEN=present" || echo "SECRET_TOKEN=missing"'
