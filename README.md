## FAQ

###Login docker registry
```bash
$ docker login registry.wake-app.net
```

###Build image
```bash
docker build -t tarantool-queue-image .
```

###Create tag
```bash
docker tag tarantool-queue-image:latest registry.wake-app.net/wakeapp/tarantool-queue-image:latest
```

###Push image
```bash
docker push registry.wake-app.net/wakeapp/tarantool-queue-image
``` 

###Pull image
```bash
docker pull registry.wake-app.net/wakeapp/tarantool-queue-image:latest
```
