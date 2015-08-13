FROM beevelop/cordova
MAINTAINER Maik Hummel <yo@beevelop.com>

# @todo: CORCI_VERSION
ENV CORCI_NAME Larry

# Install git and 7zip
RUN apt-get install -y git p7zip-full

# Install corci-android
RUN npm install -g beevelop/corci-android

COPY cmd.sh /sbin/corci.sh
RUN chmod 755 /sbin/corci.sh

CMD /sbin/corci.sh

VOLUME ["/data", "/builds"]
WORKDIR /data