FROM centos

RUN dnf update -y && \
    dnf install git -y

RUN dnf module list nodejs && \
    dnf module install nodejs:10 -y

# Create group and user (don't run as root)
RUN groupadd lwm2m && \
    useradd lwm2m -glwm2m

# Create a folder to check out the code to
RUN mkdir -p /src/lwm2m && \
    chown -R lwm2m /src/lwm2m && \
    chgrp -R lwm2m /src/lwm2m

# Switch to user who will be running the application
USER lwm2m:lwm2m

# Checkout the code and build it
RUN cd /src/lwm2m && \
    git clone https://github.com/telefonicaid/lightweightm2m-iotagent.git && \
    cd lightweightm2m-iotagent && \
    npm install

ENTRYPOINT /src/lwm2m/lightweightm2m-iotagent/bin/lwm2mAgent.js