from openjdk:8-jdk-alpine
run mkdir -p /app/source
copy . /app/source
WORKDIR /app/source
run ./mvnw clean package
RUN echo "Hello maven build finish!!!"
