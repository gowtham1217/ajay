FROM amazonlinux 
RUN yum upgrade && yum install -y git maven tar wget tree 
WORKDIR /chandini
RUN git clone 'https://github.com/gowtham1217/ajay.git'
RUN cd ajay && mvn clean package
ADD "https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.24/bin/apache-tomcat-11.0.24.tar.gz" /chandini
RUN tar -xvzf apache-tomcat-11.0.24.tar.gz 
RUN cp /chandini/ajay/target/*.war /chandini/apache-tomcat-11.0.24/webapps
EXPOSE 8080
CMD ["/chandini/apache-tomcat-11.0.24/bin/catalina.sh","run"]
