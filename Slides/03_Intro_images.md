# Anatomie

<figure style="position: absolute; bottom: 300px; right: 300px;">
    <img src="ressources/containers.png" alt="docker-con"/>
</figure>



## Architecture 1/2

- Développé en Go
- OSS / github.com/docker
- Architecture client / server
- API REST commune aux différentes briques

<figure style="position: absolute; bottom: 50px; right: 50px;">
    <img src="ressources/animals-august2015.png" alt="docker-hack-day"/>
</figure>



## Architecture 2/2

![Standing on the shoulders of giant](ressources/docker-isolation-small.png)



## Containers vs VMs

![](ressources/vm-vs-docker.png)

<!-- .element: class="align-right" -->
/Repeat after me/ *Containers ARE NOT VMs !*



# Demo time

![](ressources/fingers-crossed.png)



## Concepts

- **Image**: Ensemble des données / méta données nécessaires au fonctionnement (~ template / read-only)
- **Registry**: Dépôt d'image (public / private)
- **Container**: Instance d'une image
- **Volumes**: Accès au FS de l'hôte
- **Links / Networks**: Partage de la stack réseau entre containers



## Images

- Downloaded from remote
- Imported from tarball (ubuntu, centos, ...)
- Built with `docker commit`
- Built with  *Dockerfile*

![](ressources/images-layer.png)



## Dockerfile

```Dockerfile
FROM komljen/jdk-oracle
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN \
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key \
       | apt-key add - 
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" \
       > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN apt-get -y install jenkins && rm -rf /var/lib/apt/lists/*

VOLUME ["/root/.jenkins"]

RUN rm /usr/sbin/policy-rc.d
CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war", "--webroot=/root/.jenkins/web"]

EXPOSE 8080
```



# Demo time

![](ressources/fingers-crossed.png)



## Run my first container

Select an image an push it in a container !

```
$ docker run docker/whalesay cowsay big up @orange !
 __________________ 
< big up @orange ! >
 ------------------ 
    \
     \
      \     
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
        \    \        __/             
          \____\______/   

```



## Run deeper


Options: 

 - ``-it``: interactive container
 - ``-d``: detach container from client and continue as a daemon
 - ``--name``: name of the container 
 - ``--rm``: remove container when terminated
 - ``-p``: publish port <host>:<container>
 - ``-v``: deal with volumes
 - ``--link``: deal with links



## Quick start

- Récupérer une image: 

```
docker pull ubuntu:15.04
```

- Lancer une instance: 

```
docker run --rm -it ubuntu:15.04 bash
```

- Lister les instances: 

```
docker ps
```

- Supprimer une instance: 

```
docker rm <container-name-or-id>
```

- Démarrer / Arrêter une instance: 

```
docker stop  <container-name-or-id>
docker start <container-name-or-id>
```



# Demo time

![](ressources/fingers-crossed.png)



# Résumé 

![](https://docs.docker.com/v1.8/article-img/architecture.svg)


