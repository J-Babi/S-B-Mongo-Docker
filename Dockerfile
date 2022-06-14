# FROM openjdk:8-alpine

# # Required for starting application up.
# RUN apk update && apk add /bin/sh

# RUN mkdir -p /opt/app
# ENV PROJECT_HOME /opt/app

# COPY target/spring-boot-mongo-1.0.0.war $PROJECT_HOME/spring-boot-mongo.war

# WORKDIR $PROJECT_HOME

# CMD ["java" ,"-war","./spring-boot-mongo.war"]



FROM maven:3.8.5-jdk-8-slim AS build
WORKDIR /home/app
COPY . /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 5000
COPY --from=build /home/app/target/*.war app.war
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -war /app.war" ]
