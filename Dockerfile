from openjdk:8-jdk-alpine as builder
run mkdir -p /app/source
copy . /app/source
WORKDIR /app/source
run ./mvnw clean package
RUN echo "Hello maven build finish!!!"

FROM builder
COPY --from=builder /app/source/*.jar /app/app.jar
CMD["java","-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.jar"]
