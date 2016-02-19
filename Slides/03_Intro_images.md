# Anatomie

<figure style="position: absolute; bottom: 300px; right: 300px;">
    <img src="ressources/containers.png" alt="docker-con"/>
</figure>



## Conteneur

- Environnement d'exécution isolé
- Très faible empreinte mémoire
- Concept éprouvé depuis de nombreuses années
  - "Zone" sous Solaris
  - "Jail" sous BSD
  - "Workload Partitions" sous AIX
  - Utilisation du Noyau linux

Notes : 
Environnement d'exécution isolé = ~chroot linux
Noyau linux : primitives implémentées depuis 2008



## VMs vs Conteneurs

<br/>

![](ressources/vm-vs-docker.png)



## Architecture

- Développé en Go
- OSS / https://github.com/docker
- Architecture client / server
- API REST commune aux différentes briques

<figure style="position: absolute; bottom: 50px; right: 50px;">
    <img src="ressources/animals-august2015.png" alt="docker-hack-day"/>
</figure>



## Standing on the shoulders of giant

![](ressources/docker-isolation-small.png)



## Concepts

- **Image**: Ensemble des données / méta données nécessaires au fonctionnement (~ template / read-only)
- **Registry**: Dépôt d'image (public / private)
- **Conteneur**: Instance d'une image
- **Volumes**: Accès au FS de l'hôte
- **Links / Networks**: Partage de la stack réseau entre conteneurs

<!-- .element: class="align-right" -->
/Repeat after me/ *Containers ARE NOT VMs !*



## Basics

<br/>
L'image contient le nécessaire pour faire fonctionner le conteneur

<br/>
Le cycle de vie d'un conteneur est directement liée à l'exécution de la commande principale.

<br/>
Droit root par défaut dans un conteneur, il est tout de même recommandé d'utiliser un utilisateur dédié
```
$ id
uid=0(root) gid=0(root) groups=0(root)
```

<br/>
Philosophie : Un seul et unique service (apache, tomcat, nginx, redis...) s'exécute dans un conteneur

=> Favorise la scalabilité horizontale

Notes :
Complétement isolé et n'a pas accès par défaut à la machine hôte ni aux autres conteneurs (comme les VMs)
Pas de ssh, pas de Chef ou Vagrant



## Images

- Downloaded from remote
- Imported from tarball (ubuntu, centos, ...)
- Built with `docker commit`
- Built with  *Dockerfile*
- read-only

![](ressources/images-layer.png)



## Dockerfile

```
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



## My first container

<br/>
```
$ docker run docker/whalesay cowsay "big up @VIF"
 __________________ 
< big up @VIF >
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



## En pratique

- Pull / "Aggregate file system"
- Add read-write layer
- Copy on write
- Bind ports
- Bind volumes
- Start command
- Name / sha256

<figure style="position: absolute; bottom: 100px; right: 150px;">
    <img src="ressources/container-layer.png" alt="docker-hack-day"/>
</figure>



## En pratique CLI

Options:

 - ``-it``: interactive container
 - ``-d``: detach container from client and continue as a daemon
 - ``--name``: name of the container
 - ``--rm``: remove container when terminated
 - ``-p``: publish port <host>:<container>
 - ``--volume``: deal with volumes
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

- Démarrer / Arrêter une instance:

```
docker stop  <container-name-or-id>
docker start <container-name-or-id>
```



# Hub

![](ressources/hub.docker-home.png)



## Search

![](ressources/hub.docker-search.png)



## Search

![](ressources/hub.docker-details.png)



# Résumé

![](https://docs.docker.com/v1.8/article-img/architecture.svg)



# Demo time

![](ressources/fingers-crossed.png)
