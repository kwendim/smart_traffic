do the following for setup:

sudo chmod +x launch.bash
sudo chmod +x sub.bash


to start and run your project, it's not necessary to source devel/setup.bash or write roslaunch launcher system.launch.

from terminal run
	$ ./launch.bash

The reason for this is that ros default launch doesn't have any particular sequence to running nodes. The arduino.launch file takes a few seconds to connect to the arduino therfore a delay is necessary. The bash file launches the ros_arduino_python package, waits for 15 seconds and launches the launcher system.launch file.

P.S. If you still have trouble connecting to arduino, make sure it is listed as /dev/ttyACM0. after that, do 

	$ sudo chmod 777 /dev/ttyACM0

everytime you plug in the arduino. 
