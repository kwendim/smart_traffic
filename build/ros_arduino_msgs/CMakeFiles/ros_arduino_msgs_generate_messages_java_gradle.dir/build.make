# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kidus/Desktop/smart_traffic/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kidus/Desktop/smart_traffic/build

# Utility rule file for ros_arduino_msgs_generate_messages_java_gradle.

# Include the progress variables for this target.
include ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/progress.make

ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: ros_arduino_msgs/java/ros_arduino_msgs/build.gradle
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/AnalogFloat.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/stampedInt.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/ArduinoConstants.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/SensorState.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/Analog.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/Digital.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/ServoRead.srv
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/DigitalWrite.srv
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/DigitalSetDirection.srv
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/AnalogRead.srv
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/AnalogWrite.srv
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/DigitalRead.srv
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/ServoWrite.srv
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kidus/Desktop/smart_traffic/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Compiling Java code for ros_arduino_msgs"
	cd /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs/java/ros_arduino_msgs && /home/kidus/Desktop/smart_traffic/build/catkin_generated/env_cached.sh /usr/bin/python /opt/ros/indigo/share/genjava/cmake/../../../lib/genjava/genjava_gradle_project.py --compile -o /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs/java -p ros_arduino_msgs

ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /opt/ros/indigo/share/genjava/cmake/../../../lib/genjava/genjava_gradle_project.py
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/AnalogFloat.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/stampedInt.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/ArduinoConstants.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/SensorState.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/Analog.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/msg/Digital.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/ServoRead.srv
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/DigitalWrite.srv
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/DigitalSetDirection.srv
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/AnalogRead.srv
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/AnalogWrite.srv
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/DigitalRead.srv
ros_arduino_msgs/java/ros_arduino_msgs/build.gradle: /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs/srv/ServoWrite.srv
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kidus/Desktop/smart_traffic/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating Java gradle project from ros_arduino_msgs"
	cd /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs && ../catkin_generated/env_cached.sh /usr/bin/python /opt/ros/indigo/share/genjava/cmake/../../../lib/genjava/genjava_gradle_project.py -o /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs/java -p ros_arduino_msgs
	cd /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs && touch /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs/java/ros_arduino_msgs/droppings

ros_arduino_msgs_generate_messages_java_gradle: ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle
ros_arduino_msgs_generate_messages_java_gradle: ros_arduino_msgs/java/ros_arduino_msgs/build.gradle
ros_arduino_msgs_generate_messages_java_gradle: ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/build.make
.PHONY : ros_arduino_msgs_generate_messages_java_gradle

# Rule to build all files generated by this target.
ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/build: ros_arduino_msgs_generate_messages_java_gradle
.PHONY : ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/build

ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/clean:
	cd /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs && $(CMAKE_COMMAND) -P CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/cmake_clean.cmake
.PHONY : ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/clean

ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/depend:
	cd /home/kidus/Desktop/smart_traffic/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kidus/Desktop/smart_traffic/src /home/kidus/Desktop/smart_traffic/src/ros_arduino_msgs /home/kidus/Desktop/smart_traffic/build /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs /home/kidus/Desktop/smart_traffic/build/ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ros_arduino_msgs/CMakeFiles/ros_arduino_msgs_generate_messages_java_gradle.dir/depend

