#!/usr/bin/env python

__author__= 'kidus'

import rospy
import message_filters
from ros_arduino_msgs.msg import stampedInt
from ros_arduino_msgs.srv import *
import time


rospy.init_node("traffic_control")
rate = rospy.Rate(1)  #refresh rate with which we check for vehicle activity

cars_lane1, cars_lane2,cars_lane3,cars_lane4 = 0,0,0,0 # to globally hold the number of cars that are in each lane. all are initialized to 0

INTERSECTION_DURATION = 30 #this is the amount of time allotted for all lanes to turn green. gimash dekika wust hulum lanoch ande, ande zur yihedalu
YELLOW_LIGHT_DELAY = 5 # 5 seconds given for lights to stay yellow for all vehicles to pass
is_green= False #initial condition where there are no green lanes
order = [0,0,0,0] #holds the order of lanes based on decreasing order of lane density
time_allotted = [0,0,0,0] #holds the number of seconds each lane is allowed based on the density on that lane
order_counter = -1 #Counts which lane is green
LANE_MAX_TIME = 15 #no matter how dense a lane maybe, this is the amount of seconds it's allowed to stay green

#PIN CONFIGURATION FOR ARDUINO
#PIN(1,2,3) -> lane 1 red, yellow, green
#PIN(4,5,6) -> lane 2 red, yellow, green
#PIN(7,8,9) -> lane 3 red, yellow, green
#PIN(10,11,12) -> lane 4 red, yellow, green




def density_check():
	global order_counter, order
	temp_order = [(cars_lane1,1),(cars_lane2,2),(cars_lane3,3),(cars_lane4,4)]
	rospy.loginfo(str(temp_order))
	temp_order.sort(key = lambda tup: tup[0]) 
	rospy.loginfo("sorted" + str(temp_order))
	ctr = 0
	for item in temp_order:
		order[ctr]=item[1]
		time_for_lane = (item[0] / float(sum([cars_lane1, cars_lane2,cars_lane3,cars_lane4]))) * INTERSECTION_DURATION
		if (time_for_lane <= LANE_MAX_TIME):
			time_allotted[ctr] = int(time_for_lane)
		else:
			time_allotted[ctr] = 180
		ctr+=1
	order.reverse() #sorts the lanes from most to least dense and stores the lane numbers
	time_allotted.reverse() #allots a given time to each lane
	order_counter = 0 #iterates to the order identifying which lane to turn green
	rospy.loginfo(str(order) + " , " + str(time_allotted))



def make_green(lane):
	#insert code to turn light in specific lane green. make sure to turn other lanes red
	print "make lane " + str(lane) + " green. Turn other lanes red"

def make_yellow(lane):
	#insert code to turn light in specific lane yellow. Also add a sleep delay with the time of YELLOW_LIGHT_DELAY here.
	print "make lane " + str(lane) + " yellow" 
	print "sleeping for " + str(YELLOW_LIGHT_DELAY) + " seconds while cars clear"

def make_red(lane):
	#insert code to turn light in specific lane red
	print "make lane " + str(lane) + " red" 

def reset():
	global order_counter, order,time_allotted,is_green
	order_counter = -1
	order = [0,0,0,0]
	time_allotted = [0,0,0,0]
	is_green = False

#The callbacks below are for subscribing and reporting how many cars are in each lane. Read about message_filters.

def lane1_callback(data): 
	global cars_lane1 #By setting the variable to global, we change it's value in all parts of the code and not just in this function
	temp = cache.getInterval(cache.getOldestTime(), cache.getLastestTime()) #arguments are timestamp
	lane1_counter = 0
	for car in temp:
		lane1_counter += car.value 
	cars_lane1 = int(lane1_counter / len(temp)) # from the loop above we added the number of cars reported in each frame and divide it by the number of items to get average vehicle no
	#rospy.loginfo("lane 1: " + str([cars_lane1, len(temp)]))

def lane2_callback(data):
	global cars_lane2
	temp = cache2.getInterval(cache2.getOldestTime(), cache2.getLastestTime())
	lane2_counter = 0
	for car in temp:
		lane2_counter += car.value
	cars_lane2 = int(lane2_counter / len(temp))
	#rospy.loginfo("lane 2: " + str([cars_lane2,len(temp)]))


def lane3_callback(data):
	global cars_lane3
	temp = cache3.getInterval(cache3.getOldestTime(), cache3.getLastestTime())
	lane3_counter = 0
	for car in temp:
		lane3_counter += car.value
	cars_lane3 = int(lane3_counter / len(temp))
	#rospy.loginfo("lane 3: " + str([cars_lane3, len(temp)]))


def lane4_callback(data):
	global cars_lane4
	temp = cache4.getInterval(cache4.getOldestTime(), cache4.getLastestTime())
	lane4_counter = 0
	for car in temp:
		lane4_counter += car.value
	cars_lane4 = int(lane4_counter / len(temp))
	#rospy.loginfo("lane 4: " + str([cars_lane4, len(temp)]))


#the message filters below are used to cache the messages published on each topic. This is necessary because the 
#camera capture packages publish the number of cars detected on a frame to frame basis. In an instance 
#where the vehicled detector missess detecting a vehicle for a few frames(false negatives), the subscriber might 
#get car count of 0, indicating no vehicles on a lane which is not correct. Therefore, using a cache, we take the 
#average number of cars detected in 5(or any number) of frames. This way, we increase the tolerance of our vehicle 
#detector.


#In all the camera capture packages and this one, we have changed the message type of the lane counters to 'stampedInt'.
#stampedInt is a custom message type i've created in the ros_arduino_msgs folder which is basically an Integer that 
#also has a time stamp. The time stamp is required to use the message filter's caching capability. 


lane1 = message_filters.Subscriber("/lane1_cars", stampedInt)
cache = message_filters.Cache(lane1, 5) #Change number to change the cache size. A value of 1 represents the same thing as no caching.
cache.registerCallback(lane1_callback)

lane2 = message_filters.Subscriber("/lane2_cars", stampedInt)
cache2 = message_filters.Cache(lane2, 5) 
cache2.registerCallback(lane2_callback)

lane3 = message_filters.Subscriber("/lane3_cars", stampedInt)
cache3 = message_filters.Cache(lane3, 5)
cache3.registerCallback(lane3_callback)

lane4 = message_filters.Subscriber("/lane4_cars", stampedInt)
cache4 = message_filters.Cache(lane4, 5)
cache4.registerCallback(lane4_callback)

#The main loop where we execute our algorithm
while not rospy.is_shutdown():
	rospy.loginfo('inloop')
	number_of_cars = [cars_lane1, cars_lane2, cars_lane3, cars_lane4]
	if is_green == False:
		if ([cars_lane1,cars_lane2,cars_lane3,cars_lane4] == [0,0,0,0]):
			rospy.sleep(0.5)
			continue
		density_check()
		make_green(order[order_counter])
		time_start = time.time()
		is_green = True
		continue
	else:
		time_left = time.time() - time_start
		if (time_left < time_allotted[order_counter] ):
			if (number_of_cars[order[order_counter]- 1] == 0):
				if(order_counter == 3):
					reset()
					print "lane has no traffic"
					continue
				else:
					make_yellow(order[order_counter])
					make_red(order[order_counter])
					order_counter +=1
					make_yellow(order[order_counter])
					make_green(order[order_counter])
					time_start = time.time()
					print "lane has no traffic"

		else:
			if(order_counter == 3):
					reset()
					continue
			else:
				make_yellow(order[order_counter])
				make_red(order[order_counter])
				order_counter +=1
				make_yellow(order[order_counter])
				make_green(order[order_counter])
				time_start = time.time()
	rate.sleep()
#rospy.loginfo(str([cars_lane1,cars_lane2,cars_lane3,cars_lane4]))
