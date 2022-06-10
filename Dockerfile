FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo.war $PROJECT_HOME/spring-boot-mongo.war

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
