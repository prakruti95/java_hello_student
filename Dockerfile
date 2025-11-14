FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY target/java_hello_student-1.0-SNAPSHOT-jar-with-dependencies.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app/app.jar"]

