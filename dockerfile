FROM amazonlinux 
RUN yum upgrade && yum install -y git maven tar wget tree 
WORKDIR /chandini
RUN git clone 'https://github.com/gowtham1217/ajay.git'
RUN cd ajay && mvn clean package
ADD https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.25/bin/apache-tomcat-11.0.25.tar.gz /chandini
RUN tar -xvzf apache-tomcat-11.0.25.tar.gz 
RUN cp /chandini/ajay/target/*.war /chandini/apache-tomcat-11.0.25/webapps
EXPOSE 8080
CMD ["/chandini/apache-tomcat-11.0.25/bin/catalina.sh","run"]
