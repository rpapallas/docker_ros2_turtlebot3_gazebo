.PHONY: build docker-run run-mac run-linux

build:
	docker build -t ros2-humble .

push:
	docker push rpapallas/ros2-humble-turtlebot3-gazebo-vnc


docker-run:
	@docker run \
		-p 6080:80 \
		--shm-size=512m \
		-v $(shell pwd)/home:/home/ubuntu \
		--security-opt seccomp=unconfined \
		ros2-humble \
		--gpus all \

run-mac:
	@open -a Safari http://127.0.0.1:6080
	@make docker-run

run-linux:
	@firefox http://127.0.0.1:6080
	@make docker-run

