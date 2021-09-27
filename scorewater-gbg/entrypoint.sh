#!/bin/bash

echo "************************************"
echo "** PostgreSQL/PostGIS entrypoint  **"
echo "************************************"

set -e  # Stop on error
set -u  # All variables must be defined

echo "MQTT URL: ${MQTT_BROKER_URL}"
echo "MQTT Port: ${MQTT_BROKER_PORT}"
echo "MQTT Username: ${MQTT_BROKER_USERNAME}"
echo "MQTT Password: ${MQTT_BROKER_PASSWORD}"
echo "MQTT Topic: ${MQTT.BROKER.TOPIC}"

# Environment variables take precednce over variables defined in application.properties
java -jar /src/civity/scorewater-minimum-viable-iot-agent/scorewater-gbg-bathing-water/target/scorewater-gbg-bathing-water-1.0-SNAPSHOT.jar --mqtt.broker.url="${MQTT_BROKER_URL}" --mqtt.broker.port="${MQTT_BROKER_PORT}" --mqtt.broker.username="${MQTT_BROKER_USERNAME}" --mqtt.broker.password="${MQTT.BROKER.TOPIC}" --mqtt.broker.topic="${MQTT.BROKER.TOPIC}"
