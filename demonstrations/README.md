## DEMO 1 : Runs and builds

```bash
docker run busybox echo "Hello Orange !"
docker run docker/whalesay cowsay "Hello Orange !"
cd 01b-First-build
docker build -t wgetip .
docker run wgetip
docker run wgetip ipinfo.io/hostname
cd ..
# on lance un tomcat
docker run -d -p 8080:8080 tomcat:7
# on vérifie que ça tourne
docker ps
# on l'affiche
curl http://localhost:8080
```

## DEMO 2 : Dev Stack and Volumes

Le principe est que l'appli est à la fois packagée dans une image Docker et modifiée en local grâce aux volumes

```bash
cd 02-Dev-Env
docker build -t my-killer-app .
docker run -d -p 80:5000 -e DEV_MODE=true --volume ${PWD}:/usr/src/app my-killer-app
curl localhost/hello/Orange
## change the returned message and F5
cd ..
```

## DEMO 2bis : Links
```bash
docker run --name cache redis
```

## DEMO 3 : Compose

Stack Angular servie par Node + Java Spring + cache Redis

```bash
cd 03-Compose
# avant plan avec logs (Ctrl+C to quit)
docker-compose up
# arriere plan
#docker-compose -d up
#docker-compose stop
cd ..
```

## DEMO 4 : Swarm

### Init
*A faire avant de commencer la présentation<br>*
Création d'un cluster Swarm dont on récupère l'id, et création de 5 VM qui vont s'autoenregister sur le cluster

```bash
cd 04-Swarm
docker pull swarm
export SWARM_ID=$(docker run --rm swarm create)
./container_ec2setup.sh start 5
```

### Demo

```bash
# Si on doit rejoindre le cluster
docker run -d swarm join --addr=$(curl -sf http://ipinfo.io/ip):2375 token://$SWARM_ID
#
# on crée un manager pour le cluster (port 2376)
docker run -d -p 2376:2375 swarm manage token://$SWARM_ID
# mise en place de traefik (NOTA : on le fait localement, hors swarm)
docker run -d -p 8080:8080 -p 80:80 -v $PWD/traefik.toml:/traefik.toml --net=host emilevauge/traefik
# on change le host sur lequel est branché le client
export OLD_DOCKER_HOST=$DOCKER_HOST
export DOCKER_HOST=tcp://localhost:2376
# on affiche les infos du cluster (6 noeuds normalement)
docker version
docker info
docker ps
# on run un ou deux container
docker run -d --label-file labels ggerbaud/hello-hostname
docker ps
# s'y connecter
# contraintes
# noeud
docker run -d --label-file labels -e constraint:node==node1 ggerbaud/hello-hostname
```
## DEMO BONUS

```bash
cd ..
docker build -t zenika/docker-insight .
docker run -it --name talk-docker-insight -v $(PWD)/Slides:/data/Slides -p 8000:8000 zenika/docker-insight
docker run -it --rm -v $(PWD)/dist/:/data/dist/ -v $(PWD)/Slides:/data/Slides zenika/docker-insight package
```
