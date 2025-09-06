#!/bin/bash

kubectl set resources deploy/myapp \
  --requests=cpu=10m,memory=64Mi \
  --limits=cpu=200m,memory=256Mi
kubectl rollout status deploy/myapp
