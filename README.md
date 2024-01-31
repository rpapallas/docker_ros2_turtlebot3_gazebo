This is a Dockerfile built on top of [tiryoh/docker-ros2-desktop-vnc](https://github.com/Tiryoh/docker-ros2-desktop-vnc)
to support turtlebot3 and Gazebo for University of Leeds' [COMP3631](https://rpapallas.com/teaching/comp3631) module.

You can pull the image from Docker Hub at
[rpapallas/ros2-humble-turtlebot3-gazebo-vnc](https://hub.docker.com/r/rpapallas/ros2-humble-turtlebot3-gazebo-vnc).

To help with managing the container, you can make use of the Makefile I prepared:

* `make pull` will pull the image for either ARM or AMD64.
* `make build` will build the image locally from the `Dockerfile`.
* `make run-mac` will run it on macOS.
* `make run-windows` will run it on Windows.
* `make run-linux` will run it on Linux (although we suggest Singularity/Apptainer for Linux).

I have only tested this with macOS (Apple Silicon; M1) and Linux (AMD64). Not
tested on Windows. Currently with Arm there is an issue with robot's LiDAR sensor.


