#!/bin/sh

# On EC2, the ephemeral disk might be mounted on /mnt.
# If /mnt is a mountpoint, place Docker workspace on it.
if mountpoint -q /mnt
then
	mkdir /mnt/docker
	ln -s /mnt/docker /var/lib/docker
fi

# Set the hostname to be the public IP address of the instance.
# If the call to myip fails, set a default hostname.
if ! curl --silent --fail http://myip.enix.org/REMOTE_ADDR >/etc/hostname; then
    echo dockerhost >/etc/hostname
fi
service hostname start

# Fancy prompt courtesy of @soulshake.
echo 'export PS1="\[\033[0;35m\]\u@\H \[\033[0;33m\]\w\[\033[0m\]: "' >> /etc/skel/.bashrc

# export swarm token
export SWARM_ID=##SWARM_ID##
echo 'export SWARM_ID=$SWARM_ID' >> /etc/skel/.bashrc

# Create Docker user.
useradd -d /home/docker -m -s /bin/bash docker

echo docker:training | chpasswd

echo "docker ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/docker

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service ssh restart

apt-get -q update
apt-get -qy install git jq python-pip

# This will install the latest Docker.
curl https://get.docker.com/ | sh

# Allow connections through a local HTTP socket.
# This is to allow API experimentation with curl.
echo 'DOCKER_OPTS="-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375"' >> /etc/default/docker
service docker restart

pip install -U docker-compose

# Link so that older versions of the training still work properly
ln -s /usr/local/bin/docker-compose /usr/local/bin/fig

# Wait for docker to be up.
# If we don't do this, Docker will not be responsive during the next step.
while ! docker version
do
	sleep 1
done

# git clone our repo
git clone https://github.com/ZenikaOuest/talk-docker-insight.git /home/docker/talk-docker-insight/
sudo chown -R docker /home/docker/talk-docker-insight

# Pre-pull a bunch of images.
for I in \
	swarm ubuntu:latest postgres redis nginx emilevauge/traefik ggerbaud/hello-hostname python:3.5.0-onbuild docker/whalesay
do
	docker pull $I
done

docker run -d swarm join --addr=$(curl --silent --fail http://myip.enix.org/REMOTE_ADDR):2375 token://$SWARM_ID
