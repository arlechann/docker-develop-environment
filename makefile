.PHONY: all build rmi clean

IMAGE := develop
VERSION := latest

all: docker/Dockerfile
	cd docker && make build
	make build

build:
	docker build . -t $(IMAGE):$(VERSION) --build-arg PASSWORD=$$(bash -c 'read -sp "Password: " pass; echo -e $$pass') --build-arg UID=$$(id -u)

docker/Dockerfile:
	git clone https://github.com/arlechann/docker-archlinux-yay docker

rmi:
	docker rmi $(IMAGE):$(VERSION)

clean:
	make rmi
	cd docker && make clean
