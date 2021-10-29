#!/bin/bash
docker login
docker build -t c1-app-sec-tomcat .
docker tag c1-app-sec-tomcat ${DOCKER_USERNAME}/c1-app-sec-tomcat:latest
docker push ${DOCKER_USERNAME}/c1-app-sec-tomcat:latest

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  annotations:
    service.alpha.kubernetes.io/tolerate-unready-endpoints: "true"
  name: c1-app-sec-tomcat
  labels:
    app: c1-app-sec-tomcat
spec:
  type: LoadBalancer
  ports:
  - port: 8080
    name: c1-app-sec-tomcat
    targetPort: 8080
  selector:
    app: c1-app-sec-tomcat
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: c1-app-sec-tomcat
  name: c1-app-sec-tomcat
spec:
  replicas: 1
  selector:
    matchLabels:
      app: c1-app-sec-tomcat
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: c1-app-sec-tomcat
    spec:
      containers:
      - name: c1-app-sec-tomcat
        image: ${DOCKER_USERNAME}/c1-app-sec-tomcat:latest
        imagePullPolicy: Always
        env:
        - name: TREND_AP_KEY
          value: ${APPSEC_KEY}
        - name: TREND_AP_SECRET
          value: ${APPSEC_SECRET}
        ports:
        - containerPort: 8080
EOF
