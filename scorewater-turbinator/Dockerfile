# docker stop scorewater-turbinator && docker rm scorewater-turbinator && docker build --no-cache --tag scorewater-turbinator . && docker run -p 8083:8080 --name scorewater-turbinator scorewater-turbinator MQTT_BROKER_URL=host.docker.internal

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
	
RUN ls -l /src/civity

# Switch to user who will be running the application
USER springboot:springboot

# Checkout the code
RUN cd /src/civity && \
    git clone https://github.com/CivityNL/SCOREwater-Java.git

# Build 
RUN cd /src/civity/SCOREwater-Java/civity-rest-client && \
    mvn clean install

RUN cd /src/civity/SCOREwater-Java/civity-rest-client && \
    mvn clean install

RUN cd /src/civity/SCOREwater-Java/orion-contextbroker-client && \
    mvn clean install

RUN cd /src/civity/SCOREwater-Java/scorewater-minimum-viable-iot-agent && \
    mvn clean install

# The Spring Boot application is running on port 8080 (though there is nothing there yet)
EXPOSE 8080

# Define entrypoint
COPY entrypoint.sh /src/civity/entrypoint.sh
RUN dos2unix /src/civity/entrypoint.sh && \
    chmod +x /src/civity/entrypoint.sh
ENTRYPOINT ["/src/civity/entrypoint.sh"]
