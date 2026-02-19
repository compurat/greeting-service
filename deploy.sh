2#!/bin/bash

# Zorg dat minikube de lokale docker daemon gebruikt
eval $(minikube docker-env)

# Bouw de images
docker build --build-arg SERVICE=good-morning-service -t good-morning-service:latest .
docker build --build-arg SERVICE=good-evening-service -t good-evening-service:latest .
docker build --build-arg SERVICE=good-night-service -t good-night-service:latest .

# Pas de manifests toe
kubectl apply -f k8s/

echo "Services zijn gedeployd."
echo "Gebruik 'minikube service gateway-service' om de gateway te openen of gebruik de URL:"
echo "http://localhost:8082/greeting?time=morning"
echo "(Let op: hiervoor moet je mogelijk 'minikube tunnel' draaien in een aparte terminal als je de LoadBalancer direct wilt bereiken)"
