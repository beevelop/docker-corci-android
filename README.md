[![Travis](https://img.shields.io/travis/beevelop/docker-corci-android.svg?style=flat-square)](https://travis-ci.org/beevelop/docker-corci-android)
[![Docker Pulls](https://img.shields.io/docker/pulls/beevelop/corci-android.svg?style=flat-square)](https://links.beevelop.com/d-corci-android)
[![ImageLayer](https://badge.imagelayers.io/beevelop/corci-android:latest.svg)](https://imagelayers.io/?images=beevelop/corci-android:latest)
[![Beevelop](https://links.beevelop.com/honey-badge)](https://beevelop.com)

# CorCI-Android
### based on [beevelop/cordova](https://github.com/beevelop/docker-cordova)
----
### Pull from Docker Hub
```
docker pull beevelop/corci-android:latest
```

### Build from GitHub
```
docker build -t beevelop/corci-android github.com/beevelop/docker-corci-android
```

### Run image
Before running the CorCI-Android container, launch a CorCI-Server container as described in [CorCI-Server's README](https://github.com/beevelop/docker-corci-server).

```
docker run -d --name corci-larry --link corci-duke:corci beevelop/corci-android
```
