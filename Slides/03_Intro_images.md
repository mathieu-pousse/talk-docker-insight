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



## Concepts

- **Image**: Ensemble des données / méta données nécessaires au fonctionnement (~ template / read-only)
- **Registry**: Dépôt d'image (public / private)
- **Container**: Instance d'une image
- **Volumes**: Accès au FS de l'hôte
- **Links / Networks**: Partage de la stack réseau entre containers



## Images

- Peut être importé (ubuntu, centos, ...)
- Se construit par couche successive avec `docker commit`
- Via un Dockerfile

![](ressources/images-layer.png)

https://docs.docker.com/v1.8/article-img/architecture.svg


## Quick start

- Récupérer une image: 

```docker pull ubuntu:15.04```

- Lancer une instance: 

```docker run --rm -it ubuntu:15.04 bash```

- Lister les instances: 

```docker ps```

- Supprimer une instance: 

```docker rm 3876...```


