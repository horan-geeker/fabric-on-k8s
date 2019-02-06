#!/bin/bash
kubectl apply -f zk-kafka-namespace.yaml
kubectl apply -f zookeeper-statefulset.yaml
kubectl apply -f kafka0.yaml
kubectl apply -f kafka1.yaml
kubectl apply -f kafka2.yaml
kubectl apply -f kafka3.yaml
kubectl apply -f orderer.yaml
kubectl apply -f peerOrg1.yaml
kubectl apply -f peerOrg2.yaml