FROM tiryoh/ros2-desktop-vnc:humble

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      wget \
      curl \
      git \
      build-essential \
      vim \
      tmux \
      sudo \
      lsb-release \
      locales \
      bash-completion \
      tzdata gosu 

RUN useradd --create-home --home-dir /home/ubuntu --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# COMP3631 specific commands
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    python3-rosdep \
    libpython3-dev \
    ros-dev-tools \
    python3-argcomplete \
    libcanberra-gtk-module \
    ros-humble-ros-gz \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-dynamixel-sdk \
    ros-humble-turtlebot3-msgs \
    ros-humble-image-view \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    ros-humble-turtlebot3

RUN pip3 install argcomplete

# This fixes an issue with colcon build and Python packages in ROS2
RUN pip install setuptools==58.2.0
RUN pip install scikit-image

RUN apt update && apt install -y software-properties-common
RUN add-apt-repository -y ppa:openrobotics/gazebo11-non-amd64
RUN apt update
RUN apt install -yq gazebo
RUN apt install -yq libgazebo-dev ros-humble-camera-info-manager
RUN apt install -yq ros-humble-gazebo* ros-humble-desktop python3-rosdep libpython3-dev ros-dev-tools python3-argcomplete
RUN sed -i 's/robot_model_type: "differential"/robot_model_type: "nav2_amcl::DifferentialMotionModel"/' /opt/ros/humble/share/turtlebot3_navigation2/param/burger.yaml

RUN rm -rf /var/lib/apt/lists/*
