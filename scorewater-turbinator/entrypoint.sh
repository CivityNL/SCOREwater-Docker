#!/bin/sh

echo "*********************************"
echo "** Spring Boot app entrypoint  **"
echo "*********************************"

set -e  # Stop on error
set -u  # All variables must be defined

if [ ! -f /src/civity/SCOREwater-Java/scorewater-minimum-viable-iot-agent/scorewater-turbinator/target/scorewater-turbinator-1.0-SNAPSHOT.jar ] ; then
    echo "Spring Boot app scorewater-turbinator-1.0-SNAPSHOT.jar not found!"
	exit 1
else 
    echo "Spring Boot app scorewater-turbinator-1.0-SNAPSHOT.jar does exist. Please do continue"
fi

echo "MQTT URL: ${MQTT_BROKER_URL}"
echo "MQTT Port: ${MQTT_BROKER_PORT}"
echo "MQTT Username: ${MQTT_BROKER_USERNAME}"
echo "MQTT Password: ${MQTT_BROKER_PASSWORD}"
echo "MQTT Topic: ${MQTT_BROKER_TOPIC}"


# Environment variables take precedence over variables defined in application.properties
java -jar /src/civity/SCOREwater-Java/scorewater-minimum-viable-iot-agent/scorewater-turbinator/target/scorewater-turbinator-1.0-SNAPSHOT.jar --mqtt.broker.url="${MQTT_BROKER_URL}" --mqtt.broker.port="${MQTT_BROKER_PORT}" --mqtt.broker.username="${MQTT_BROKER_USERNAME}" --mqtt.broker.password="${MQTT_BROKER_PASSWORD}" --mqtt.broker.topic="${MQTT_BROKER_TOPIC}"

exit 0
