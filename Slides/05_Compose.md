# docker ecosystème

<figure style="position: absolute; bottom: 10px; right: 200px">
    <img src="ressources/ecosystem.jpg" alt="Logo Docker" width="650" />
</figure>

Notes :
L'ensemble des outils ci après sont OSS et gratuits



# docker compose

<figure style="position: absolute; bottom: 50px; right: 400px">
    <img src="ressources/logo_compose.png" alt="Logo Docker" width="460" />
</figure>



## Use case

Permet de démarrer plusieurs conteneurs simultanément

<br/>
Idéal pour le développement

<br/>
Fichier de configuration yaml simple

<br/>
Image, liens, volumes, # instances

<br/>
Contrôle un ensemble cohérent de conteneur



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



# Demo time

![](ressources/fingers-crossed.png)



# docker machine

<figure style="position: absolute; bottom: 50px; right: 400px">
    <img src="ressources/logo-machine.png" alt="Logo Docker" width="460" />
</figure>



# docker machine

<br/><br/><br/><br/><br/>
Easy setup & well configured for Linux, Windows, MacOS, Google, AWS, ...

<figure style="position: absolute; bottom: 50px; right: 150px">
    <img src="https://docs.docker.com/engine/installation/images/linux_docker_host.svg" alt="Logo Docker" />
</figure>

<figure style="position: absolute; bottom: 50px; right: 600px">
    <img src="https://docs.docker.com/engine/installation/images/win_docker_host.svg" alt="Logo Docker" />
</figure>



# docker kitematic

<figure style="position: absolute; bottom: 150px; right: 250px">
    <img src="https://pbs.twimg.com/profile_images/505211933666975745/ZyasF8Em_400x400.png" alt="Logo Docker" width="350" />
</figure>
<figure style="position: absolute; bottom: 150px; left: 250px">
    <img src="ressources/product_kitematic.png" alt="Logo Docker" width="350" />
</figure>



## gui for docker #1

![](ressources/kitematic-browse-images.png)



## gui for docker #2

![](ressources/kitematic-cli-redis-container.png)



## gui for docker #3

![](ressources/kitematic-volumes-dir.png)



# docker toolbox

<figure style="position: absolute; bottom: 150px; right: 350px">
    <img src="https://www.docker.com/sites/default/files/products/tbox.jpg" alt="Logo Docker" />
</figure>


