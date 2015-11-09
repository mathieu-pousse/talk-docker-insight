# Hello world

docker run --rm ubuntu:14.04 echo "Hello world !"

# Advanced hello world

docker run --rm docker/whalesay:latest "Yo mama !"

# rm -rf /

docker run --rm -it ubuntu:14.04 /bin/bash
> rm -rf / 2>/dev/null
> ls

