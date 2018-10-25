## FAQ

###Login docker registry
```bash
$ docker login registry.wake-app.net
```

###Build image
```bash
docker build -t tarantool-queue .
```

###Create tag
```bash
docker tag tarantool-queue:latest registry.wake-app.net/wakeapp/tarantool-queue:latest
```

###Push image
```bash
docker push registry.wake-app.net/wakeapp/tarantool-queue
``` 

###Pull image
```bash
docker pull registry.wake-app.net/wakeapp/tarantool-queue:latest
```
