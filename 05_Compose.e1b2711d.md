# docker compose

<figure style="position: absolute; bottom: 50px; right: 400px">
    <img src="ressources/logo_compose.acbb42a2.png" alt="Logo Docker" width="460" />
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

