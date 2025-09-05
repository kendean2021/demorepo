#!/bin/bash

minikube addons enable ingress
kubectl -n ingress-nginx get pods

kubectl apply -f ingress.yaml
