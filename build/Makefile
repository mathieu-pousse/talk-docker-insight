.PHONY: all
# TODO run this from a well tuned docker container
all: 
	docker build -t talk-converter .
	echo "YO BRO IT IS WORKING VERY WELL LIKE THAT, B!"
	docker run -it --rm --volume ${PWD}/..:/usr/src/slides talk-converter
