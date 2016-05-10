# Ecosystème Docker

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



# docker swarm

<figure style="position: absolute; bottom: 50px; right: 300px">
    <img src="ressources/logo_swarm.png" alt="Logo Docker" />
</figure>



## Principes

Gère des clusters d'hôte docker

Basé sur l'API de docker (compatible avec compose)

  1. ouvrir le daemon docker sur TCP
  2. configurer TLS
  3. 1 manager
  4. x nodes

<br/>
La création / répartition des conteneur est à la charge de swarm

Aléatoire / Répartition de charge / Contraintes



# docker toolbox

<figure style="position: absolute; bottom: 150px; right: 350px">
    <img src="https://www.docker.com/sites/default/files/products/tbox.jpg" alt="Logo Docker" />
</figure>


