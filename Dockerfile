# syntax=docker/dockerfile:1

FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /workspace

# Kies welke module je buildt (bijv. good-morning-service)
ARG SERVICE

# Kopieer de hele repo (simpel en betrouwbaar in een multi-module Maven project)
COPY .. .

# Bouw alleen de gekozen module + benodigde modules
RUN test -n "$SERVICE" && \
    mvn -pl "$SERVICE" -am -DskipTests package

FROM eclipse-temurin:17-jre AS runtime
WORKDIR /app

ARG SERVICE

# Neem de Spring Boot jar uit de gekozen module
COPY --from=build /workspace/${SERVICE}/target/*.jar /app/app.jar

# Standaard containerpoort (je kunt extern mappen zoals je wilt)
EXPOSE 8080

# Optioneel: je kunt SERVER_PORT meegeven bij docker run / compose
ENTRYPOINT ["java","-jar","/app/app.jar"]