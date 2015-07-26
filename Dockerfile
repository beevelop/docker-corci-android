FROM webratio/cordova
MAINTAINER Maik Hummel <yo@beevelop.com>

ENV CORDOVA_VERSION 5.1.1
ENV ANT_VERSION 1.9.6
ENV ANDROID_SDK_FILENAME android-sdk_r24.3.3-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz
ENV ANDROID_API_LEVELS android-15,android-16,android-17,android-18,android-19,android-20,android-21,android-22
ENV ANDROID_BUILD_TOOLS_VERSION 22.0.1
ENV NODE_VERSION 0.12.7

ENV CORCI_NAME Larry

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git p7zip-full

RUN npm install -g beevelop/corci-android

COPY cmd.sh /sbin/corci.sh
RUN chmod 755 /sbin/corci.sh

CMD /sbin/corci.sh

VOLUME ["/data", "/builds"]
WORKDIR /data