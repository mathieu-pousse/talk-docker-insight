## DEMO 1

```
docker run --rm busybox echo "Hello Orange !"
docker run --rm docker/whalesay cowsay "Hello Orange !"
cd 01b-First-build
docker build -t wgetip .
docker run --rm wgetip
cd ..
docker run -d -p 8080:8080 tomcat:7
xdg-open http://localhost:8080
```

## DEMO 2

```
cd 02-Dev-Env
docker build -t my-killer-node-app .
docker run -d -p 80:3000 --volume ${PWD}/js:/usr/src/app/js my-killer-node-app
xdg-open http://localhost/hello/Orange
## change the returned message and F5
cd ..
```

## DEMO 3

```
cd 03-Compose
# avant plan avec logs (Ctrl+C to quit)
docker-compose up
# arriere plan
#docker-compose -d up
#docker-compose stop
cd ..
```

## DEMO 4

### Init
A faire avant de commencer la présentation
Création d'un cluster swarm dont on récupère l'id, et création de 5 VM qui vont s'autoenregister sur le cluster

```
cd 04-Swarm
docker pull swarm
export SWARM_ID=$(docker run --rm swarm create)
./container_ec2setup.sh start 5
```

### Demo

```
# on rejoint nous même le cluster
docker run -d swarm join --addr=$(curl -sf http://ipinfo.io/ip):2375 token://$SWARM_ID
# on crée un manager pour le cluster (port 2376)
docker run -d -p 2376:2375 swarm manage token://$SWARM_ID
# on change le host sur lequel est branché le client
export OLD_DOCKER_HOST=$DOCKER_HOST
export DOCKER_HOST=tcp://localhost:2376
# on affiche les infos du cluster (6 noeuds normalement)
docker version
docker info
docker ps
# on run un ou deux container
docker run -d nginx
docker ps
# s'y connecter
# contraintes
# noeud
docker run -d -e constraint:node==node1 nginx
# affinités
docker run -d --name mycache redis
docker run –d –e affinity:container==mycache tomcat
# equivalent
#docker run -d --link mycache:mycache tomcat
```
