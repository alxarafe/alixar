# Build stage: Maven and source code remain outside the runtime image.
FROM maven:3.9-eclipse-temurin-25@sha256:93b8a14ea2f412782e4e842651273b4d903e35cc496284f178fbbe2d67d00976 AS build

WORKDIR /workspace
COPY . .
RUN ./mvnw --batch-mode --no-transfer-progress clean verify

# Runtime stage: only the Java runtime, health-check utility, and artifact remain.
FROM eclipse-temurin:25-jre@sha256:fcd7fd7b387f94bb2ac461478a7436ad8e349924c374ea8313919624dceae636 AS runtime

WORKDIR /app
RUN apt-get update && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /workspace/target/alixar-0.1.0-SNAPSHOT.jar /app/alixar.jar

RUN chown -R 10001:0 /app
USER 10001

EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s --start-period=20s --retries=3 \
    CMD ["curl", "--fail", "--silent", "http://localhost:8080/health"]
ENTRYPOINT ["java", "-jar", "/app/alixar.jar"]