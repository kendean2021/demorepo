#!/bin/bash

minikube profile list
minikube start -p minikube --driver=docker --kubernetes-version=v1.30.0 --wait=all
minikube profile minikube
minikube status

