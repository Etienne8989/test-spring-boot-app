FROM docker.io/library/maven:latest AS build

WORKDIR /app

# Copy pom first (better caching)
COPY pom.xml .

# Download dependencies (cached layer)
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the jar
RUN mvn clean package -DskipTests


# ===== Runtime stage =====
FROM default-route-openshift-image-registry.apps.rm3.7wse.p1.openshiftapps.com/openshift/java-runtime:openjdk-17-ubi8

WORKDIR /app

# Copy built jar from build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "test-spring-boot-app-0.0.1-SNAPSHOT.jar"]
