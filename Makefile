.PHONY: pull push-amd64 push-arm64 build-amd64 build-arm64 docker-run run-mac run-linux run-windows create-manifest

DOCKER_IMAGE_NAME=rpapallas/ros2-humble-turtlebot3-gazebo-vnc

pull:
	docker image pull $(DOCKER_IMAGE_NAME):latest

push-amd64:
	docker push $(DOCKER_IMAGE_NAME):manifest-amd64

push-arm64:
	docker push $(DOCKER_IMAGE_NAME):manifest-arm64

build-amd64:
	docker build -t $(DOCKER_IMAGE_NAME):manifest-arm64 --build-arg ARCH=arm64/ .

build-arm64:
	docker build -t $(DOCKER_IMAGE_NAME):manifest-amd64 --build-arg ARCH=amd64/ .

docker-run:
	@mkdir -p home
	@docker run \
		-p 6080:80 \
		--shm-size=512m \
		-v $(shell pwd)/home:/home/ubuntu \
		--security-opt seccomp=unconfined \
		$(DOCKER_IMAGE_NAME) \
		--gpus all \

run-mac:
	@open -a Safari http://127.0.0.1:6080
	@make docker-run

run-linux:
	@firefox http://127.0.0.1:6080
	@make docker-run

run-windows:
	@start http://127.0.0.1:6080
	@make docker-run

create-manifest:
	@docker manifest create \
		$(DOCKER_IMAGE_NAME):latest \
		--amend $(DOCKER_IMAGE_NAME):manifest-amd64 \
		--amend $(DOCKER_IMAGE_NAME):manifest-arm64
	@docker manifest push $(DOCKER_IMAGE_NAME):latest

