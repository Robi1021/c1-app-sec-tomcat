#!/bin/bash
sudo rm logs/appsec.log logs/defence.log
docker build -t c1-app-sec-tomcat .

docker run -p 8080:8080 --rm \
  --name c1-app-sec-tomcat \
  -e TREND_AP_KEY=${APPSEC_KEY} \
  -e TREND_AP_SECRET=${APPSEC_SECRET} \
  -v $(pwd)/logs:/var/log/appsec:rw \
   c1-app-sec-tomcat
