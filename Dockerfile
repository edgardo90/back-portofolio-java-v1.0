# Usa una imagen ligera con Java 8
FROM openjdk:8-jdk-alpine

# Instalar curl
RUN apk update && apk add curl

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el .jar generado por Maven dentro del contenedor
COPY target/apiPortafolio-0.0.1-SNAPSHOT.jar app.jar

# Render pasa el puerto en la variable PORT
ENV PORT=8080

# Ejecuta el jar y respeta el puerto asignado por Render
CMD ["sh", "-c", "echo 'Mi IP pública es:' && curl https://api.ipify.org && java -Xmx350m -jar app.jar --server.port=$PORT"]

