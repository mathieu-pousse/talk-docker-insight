# Volumes & Links

![](ressources/docker-turtles-communication.jpg)


## Volumes

- Un conteneur est volatile
- Une fois détruit, les données écrites dedans sont perdues


## Volumes

Expose un sous ensemble du file system de l'hôte dans un conteneur

<center>⟺</center>

<!-- .element class="align-right" -->
Expose le file system d'un conteneur dans l'hôte

<br/>
⚠ Celui qui écrit le fichier est responsable des droits

<br/>
Utilisation:

- péréniser les données d'une base de données
- pousser une application dans un conteneur
- récupérer les logs d'une application s'exécutant dans un conteneur



# Demo time

![](ressources/fingers-crossed.png)



## Links

<br/>
Permet de facilement connecter des conteneurs au niveau du réseau.

<br/>
Par défaut, les conteneurs sont isolés les uns des autres

<br/>
Etanchéité des interfaces réseaux (une interface par conteneur)

<br/>
Se base sur les routes réseau (standard)



## Besoin


![](ressources/links.png)



# Demo time

![](ressources/fingers-crossed.png)


