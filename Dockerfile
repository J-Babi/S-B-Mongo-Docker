FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/spring-boot-mongo-1.0.0.war $PROJECT_HOME/spring-boot-mongo.war

WORKDIR $PROJECT_HOME

CMD ["java" ,"-war","./spring-boot-mongo.war"]
