FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.54/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

# Cloud One Application Security
ADD trend_app_protect-4.1.5.jar trend_app_protect-4.1.5.jar
ADD trend_app_protect.properties trend_app_protect.properties
ADD setenv.sh bin/setenv.sh
RUN chmod +x bin/setenv.sh
# /Cloud One Application Security

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
