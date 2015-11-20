default:  run

build:
	docker build -t zenika/docker-insight .

force-build:
	docker build --no-cache -t zenika/docker-insight .

package:
	docker run -it --rm -v $(PWD)/dist/:/data/dist/ -v $(PWD)/Slides:/data/Slides zenika/docker-insight package
	sudo chown -R $(shell id -un) dist

run:
	docker rm -f talk-docker-insight 2>/dev/null || true
	docker run -it --name talk-docker-insight -v $(PWD)/Slides:/data/Slides -p 8000:8000 zenika/docker-insight

test:
	@echo "Tester c'est douter"
