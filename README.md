# SCOREwater-Docker

Docker-compose containing components needed to get an instance of the SCOREwater platform up and running. To start the containers locally, install Docker and run the following command from the command line. 

```
docker-compose up
```

The Docker-compose file contains the following components:

* Orion ContextBroker, accessible via port 1026 ([example get entities request](http://host.docker.internal:1026/v2/entities));
* MongoDB for the ContextBroker, accessible via port 27017;
* Draco, accessible via port 5050. The administrator console is accessible via port 8081 ([link](http://host.docker.internal:8081/nifi/));
* ActiveMQ, accessible via port 61616. The administrator console is accessible via port 8161 ([link](http://host.docker.internal:8161));
* PostgreSQL database, accessible via port 5432.

In addition, the following IOT agents are present:

* Bathingwater MQTT Gothenburg running on port 8080; 
* FIWARE LWM2M IOT Agent, administrative interface running op port 4041 ([about](http://host.docker.internal:4041/iot/about)).
