FROM maven:3-jdk-11-slim as build

COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9.0.63
EXPOSE 8888
COPY --from=build /target/spring-form.war /usr/local/tomcat/webapps/
