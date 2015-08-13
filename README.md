[![](https://badge.imagelayers.io/beevelop/corci-android:latest.svg)](https://imagelayers.io/?images=beevelop/corci-android:latest 'Get your own badge on imagelayers.io')

# CorCI-android based on [beevelop/cordova](https://github.com/beevelop/docker-cordova)

> Dockerized CorCI-Android-Agent

## Example
Before running the CorCI-Android container, launch a CorCI-Server container as described in [CorCI-Server's README](https://github.com/beevelop/docker-corci-server).

```
docker run -d --name corci-larry --link corci-duke:corci beevelop/corci-android
```


## Disclaimer
> This is experimental and might break from time to time. Use at your own risk!