FROM maven:3.9.5-openjdk-19 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:19.0.1-jdk-slim
COPY --from=build /target/MollaShop-0.0.1-SNAPSHOT.jar MollaShop.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","MollaShop.jar"]
