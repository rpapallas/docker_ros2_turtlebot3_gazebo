source /opt/ros/humble/setup.bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
. /usr/share/gazebo/setup.sh

if [ -d $HOME/ros2_ws/install/ ]; then
    source $HOME/ros2_ws/install/setup.bash
fi

export ROS_DOMAIN_ID=30 #TURTLEBOT3
export TURTLEBOT3_MODEL=burger
