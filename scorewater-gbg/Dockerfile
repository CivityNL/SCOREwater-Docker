FROM openjdk:8-jdk-alpine

# Install Maven and Git so we can checkout andbuild Java code
RUN apk add maven
RUN apk add git

# Create group and user (don't run as root)
RUN addgroup -S springboot && adduser -S springboot -G springboot

# Create a folder to check out the code to
RUN mkdir -p /src/civity && \
    chown -R springboot /src/civity && \
    chgrp -R springboot /src/civity

# Switch to user who will be running the application
USER springboot:springboot

# Checkout the code and build it
RUN cd /src/civity && \
    git clone https://github.com/CivityNL/SCOREwater-Java.git && \
    cd SCOREwater-Java/civity-rest-client && \
    mvn clean install

# Copy Spring Boot jar
# COPY scorewater-gbg-1.0.jar scorewater-gbg-1.0.jar

# The Spring Boot application is running on port 8080 (though there is nothing there yet)
EXPOSE 8080

# Define entrypoint
ENTRYPOINT ["java", "-jar", "/scorewater-gbg-1.0.jar"]
