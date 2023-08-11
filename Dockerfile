FROM maven AS BUILD_STAGE
WORKDIR /app
COPY . /app
RUN mvn clean install

FROM openjdk:11
VOLUME /tmp
COPY --from BUILD_STAGE app/target/spring-boot-rest-example-0.5.0.war app.jar
EXPOSE 8091
CMD ["java", "-jar", "-Dspring.profiles.active=test" "app.jar"]
