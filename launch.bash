sudo chmod 777 /dev/ttyACM0
source ./devel/setup.bash
roslaunch ros_arduino_python arduino.launch &
sleep 10
gnome-terminal --window-with-profile=Bash -e 'bash -c "./sub.bash; read"'