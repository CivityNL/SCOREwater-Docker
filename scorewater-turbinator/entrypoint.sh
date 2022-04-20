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

echo "ActiveMQ URL: ${ACTIVEMQ_BROKER_URL}"
echo "ActiveMQ concurrent consumers: ${ACTIVEMQ_CONCURRENT_CONSUMERS}"
echo "ActiveMQ queue name prefix: ${ACTIVEMQ_QUEUE_NAME_PREFIX}"

echo "ContextBroker URL: ${CONTEXT_BROKER_URL}"
echo "ContextBroker Service: ${CONTEXT_BROKER_SERVICE}"

echo "MQTT URL: ${MQTT_BROKER_URL}"
echo "MQTT Port: ${MQTT_BROKER_PORT}"
echo "MQTT Username: ${MQTT_BROKER_USERNAME}"
echo "MQTT Topic: ${MQTT_BROKER_TOPIC}"

echo "PostgreSQL host: ${PG_HOST}"
echo "PostgreSQL Port: ${PG_PORT}"
echo "PostgreSQL Username: ${PG_USER}"
echo "PostgreSQL Database: ${PG_DATABASE}"

# Environment variables take precedence over variables defined in application.properties
java -jar -Xmx128m -Xms64m /src/civity/SCOREwater-Java/scorewater-minimum-viable-iot-agent/scorewater-turbinator/target/scorewater-turbinator-1.0-SNAPSHOT.jar --mqtt.broker.url="${MQTT_BROKER_URL}" --mqtt.broker.port="${MQTT_BROKER_PORT}" --mqtt.broker.username="${MQTT_BROKER_USERNAME}" --mqtt.broker.password="${MQTT_BROKER_PASSWORD}" --mqtt.broker.topic="${MQTT_BROKER_TOPIC}" --spring.activemq.broker-url="${ACTIVEMQ_BROKER_URL}" --spring.activemq.queue-name-prefix="${ACTIVEMQ_QUEUE_NAME_PREFIX}" --spring.activemq.concurrent-consumers="${ACTIVEMQ_CONCURRENT_CONSUMERS}" --spring.datasource.url="jdbc:postgresql://${PG_HOST}:${PG_PORT}/${PG_DATABASE}" --spring.datasource.username="${PG_USER}" --spring.datasource.password="${PG_PASSWORD}" --fiware.publish.contextbroker.url="${CONTEXT_BROKER_URL}" --fiware.publish.contextbroker.service="${CONTEXT_BROKER_SERVICE}"

exit 0
