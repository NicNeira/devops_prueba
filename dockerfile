# Utilizar una imagen base de Java21
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/helloworld-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

# comandos para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]

