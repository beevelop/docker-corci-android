FROM webratio/ant

# Ensure git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y p7zip-full

# Installs i386 architecture required for running 32 bit Android tools
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean

# Installs Android SDK
ENV ANDROID_SDK_FILENAME android-sdk_r24.0.2-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-15,android-16,android-17,android-18,android-19,android-20,android-21 
ENV ANDROID_BUILD_TOOLS_VERSION 21.1.2
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN cd /opt && \
    wget -q ${ANDROID_SDK_URL} && \
    tar -xzf ${ANDROID_SDK_FILENAME} && \
    rm ${ANDROID_SDK_FILENAME} && \
    echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION}


ENV NODE_VERSION 0.12.0
RUN cd && \
    wget -q http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz && \
    tar -xzf node-v${NODE_VERSION}-linux-x64.tar.gz && \
    mv node-v${NODE_VERSION}-linux-x64 /opt/node && \
    rm node-v${NODE_VERSION}-linux-x64.tar.gz

ENV PATH ${PATH}:/opt/node/bin

# Installs Cordova
# Forces a platform add in order to preload libraries
ENV CORDOVA_VERSION 4.2.0

RUN npm install -g npm && \
    npm install -g cordova@${CORDOVA_VERSION} && \
    cd /tmp && \
    cordova create fakeapp && \
    cd /tmp/fakeapp && \
    cordova platform add android && \
    cd && \
    rm -rf /tmp/fakeapp

# Install and run CorCI-android
ENV CORCI_HOST localhost
ENV CORCI_PORT 8000
ENV CORCI_PROTOCOL http
ENV CORCI_LOCATION ./builds
ENV CORCI_NAME Larry

RUN npm install -g beevelop/corci-android

CMD corci-android -h ${CORCI_HOST} -p ${CORCI_PORT} -q ${CORCI_PROTOCOL} -l ${CORCI_LOCATION} -n ${CORCI_NAME}

VOLUME ["/data"]
WORKDIR /data

EXPOSE 8000