# ---------- Stage 1: Build ----------
# Image with Maven + JDK 21 to compile and package the app
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /src

# Copy pom.xml first so dependencies are cached between builds
COPY pom.xml .
RUN mvn -B -q dependency:go-offline

# Copy source code and build the war (tests run in the CI pipeline, not here)
COPY src ./src
RUN mvn -B -q package -DskipTests

# ---------- Stage 2: Run ----------
# Small image with only the Java 21 runtime (no Maven, no source code)
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Run as a non-root user for security
RUN addgroup -S app && adduser -S app -G app

COPY --from=build /src/target/*.war app.war

USER app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.war"]
