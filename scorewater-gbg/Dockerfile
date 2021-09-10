FROM openjdk:8-jdk-alpine

# Create group and user (don't run as root)
RUN addgroup -S standalone && adduser -S standalone -G standalone
USER standalone:standalone

# Copy Spring Boot jar
COPY scorewater-gbg-1.0.jar scorewater-gbg-1.0.jar

# The Spring Boot application is running on port 8080 (though there is nothing there yet)
EXPOSE 8080

# Define entrypoint
ENTRYPOINT ["java", "-jar", "/scorewater-gbg-1.0.jar"]
