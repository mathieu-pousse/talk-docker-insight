Checkout http://zenikaouest.github.io/talk-docker-insight/

#Plan présentation Docker

##Docker, kézako ?
- DotCloud
- Dates clés
##Intro aux containers
- Analogie du transport de marchandise
- Compa avec VMs
##Intro aux images
- FS en oignons RO + 1 couche RW (Copy-on-write)
- commit
- Dockerfile
##Demo de build & run de quelques containers
- run echo qqch ds busybox
- build ubuntu avec wget via Dockerfile
- run d’un truc utile ? (un tomcat ?)
##Volumes et link ?
- volume : données qui echappent a l’OFS
- link : abstraction sur le network
- what else ?
## Demo avec volumes et link avec modifs a chaud du code (pas en java donc, node ?)
- une appli node ou python ou rails
- on run avec un volume, l’appli tourne, on la voie dans le browser
- sans quitter on modifie, et ça modifie a chaud (F5 sur browser)
##Docker compose
- c’est super cool
## Demo d’une stack MEAN ? ou stack Spring / Tomcat / BDD
- on montre le fichier compose
- on lance et pfiou
##Docker swarm
- c’est la même cli que docker
- la 1.0 devrait être sortie
## Demo d’un petit cluster swarm ?
- on se prépare qq VM’s qu’on a fait rejoindre le cluster au préalable
- en live, on crée un manager, on fait pointer le client sur le manager swarm, et on lance quelques containers
## Docker Machine
##Demo de Docker machine ?
- est ce utile ?
## Docker Hub
- le hub public
- le hub privé
- et ld DTR
##Nouveautés docker 1.9 applicables a ce qu’on a dit (s’il y en a)
- TBD

