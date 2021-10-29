FROM centos

ARG tomcat_version=8.5.72

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v${tomcat_version}/bin/apache-tomcat-${tomcat_version}.tar.gz && \
    tar xfz apache-tomcat-${tomcat_version}.tar.gz && \
    mv apache-tomcat-${tomcat_version}/* /opt/tomcat/. && \
    yum -y install java && \
    java -version

# Cloud One Application Security
ADD trend_app_protect-4.4.6.jar trend_app_protect-4.4.6.jar
ADD trend_app_protect.properties trend_app_protect.properties
ADD setenv.sh bin/setenv.sh
RUN chmod +x bin/setenv.sh && \
    mkdir /var/log/appsec
# /Cloud One Application Security

WORKDIR /opt/tomcat/webapps
ADD UploadServlet30.war UploadServlet30.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
