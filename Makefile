all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""  This is merely a base image for usage read the README file
	@echo ""   1. make run       - build and run docker container

build: builddocker beep

run: builddocker rundocker

rundocker:
	@docker run --name=phpdmz \
	--cidfile="cid" \
	-P \
	-v /tmp:/tmp \
	-v /var/run/docker.sock:/run/docker.sock \
	-v $(shell which docker):/bin/docker \
	-t joshuacox/phpdmz

builddocker:
	/usr/bin/time -v docker build -t joshuacox/phpdmz .

kill:
	@docker kill `cat cid`

rm-name:
	rm  name

rm-image:
	@docker rm `cat cid`
	@rm cid

rm: kill rm-image

clean: rm-name rm

enter:
	docker exec -i -t `cat cid` /bin/bash
