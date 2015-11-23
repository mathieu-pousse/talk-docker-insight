# docker ecosystème

# docker compose

<figure style="position: absolute; bottom: 50px; right: 400px">
    <img src="ressources/logo_compose.png" alt="Logo Docker" width="460" />
</figure>



## Use case

Permet de démarrer plusieurs containers simultanement

Idéal pour le developpement

Fichier de configuration yaml simple

Image, liens, volumes, # instances

Controle un ensemble cohérent de container



## docker-compose.yml

```
web:
  build: .
  ports:
   - "5000:5000"
  volumes:
   - .:/code
  links:
   - redis
redis:
  image: redis
```



# docker machine

<figure style="position: absolute; bottom: 50px; right: 400px">
    <img src="https://github.com/docker/machine/blob/master/docs/img/logo.png" alt="Logo Docker" width="460" />
</figure>



# docker machine

Easy setup & well configured !

![](https://docs.docker.com/engine/installation/images/linux_docker_host.svg)

![](https://docs.docker.com/engine/installation/images/win_docker_host.svg)


# docker kitematic

<figure style="position: absolute; bottom: 50px; right: 400px">
    <img src="https://pbs.twimg.com/profile_images/505211933666975745/ZyasF8Em_400x400.png" alt="Logo Docker" width="460" />
    Windows & MacOS
</figure>



## gui for docker #1

![](https://docs.docker.com/kitematic/images/browse-images.png)



# gui for docker #2

![](https://docs.docker.com/kitematic/images/cli-redis-container.png)



# gui for docker #3

![](https://docs.docker.com/kitematic/images/volumes-dir.png)



# docker toolbox

![All in one !](https://www.docker.com/sites/default/files/products/tbox.jpg)



