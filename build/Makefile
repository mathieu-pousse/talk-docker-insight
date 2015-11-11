.PHONY: all
# TODO run this from a well tuned docker container
all: 
	docker build -t talk-converter .
	echo "index.html" | docker run -i --rm --volume ${PWD}/..:/usr/src/slides talk-converter index.org

