# Usa una imagen ligera con Java 8
FROM openjdk:8-jdk-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el .jar generado por Maven dentro del contenedor
COPY target/apiPortafolio-0.0.1-SNAPSHOT.jar app.jar

# Render pasa el puerto en la variable PORT
ENV PORT=8080

# Ejecuta el jar y respeta el puerto asignado por Render
CMD ["sh", "-c", "java -jar app.jar --server.port=$PORT"]
