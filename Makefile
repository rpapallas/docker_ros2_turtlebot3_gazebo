.PHONY: build docker-run run-mac run-linux run-windows pull

pull:
	docker image pull rpapallas/ros2-humble-turtlebot3-gazebo-vnc

build:
	docker build -t rpapallas/ros2-humble-turtlebot3-gazebo-vnc .

push:
	docker push rpapallas/ros2-humble-turtlebot3-gazebo-vnc

docker-run:
	@mkdir -p home
	@docker run \
		-p 6080:80 \
		--shm-size=512m \
		-v $(shell pwd)/home:/home/ubuntu \
		--security-opt seccomp=unconfined \
		rpapallas/ros2-humble-turtlebot3-gazebo-vnc \
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

