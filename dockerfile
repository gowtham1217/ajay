FROM amazonlinux:2023

RUN yum update -y && \
    yum install -y git maven tar wget tree && \
    yum clean all

WORKDIR /chandini

RUN git clone https://github.com/gowtham1217/pet_shop.git

WORKDIR /chandini/pet_shop
RUN mvn clean package

WORKDIR /chandini

ADD https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.24/bin/apache-tomcat-11.0.24.tar.gz /chandini/

RUN tar -xzf apache-tomcat-11.0.24.tar.gz && \
    cp /chandini/pet_shop/target/petshop.war \
       /chandini/apache-tomcat-11.0.24/webapps/

EXPOSE 8080

CMD ["/chandini/apache-tomcat-11.0.24/bin/catalina.sh", "run"]
