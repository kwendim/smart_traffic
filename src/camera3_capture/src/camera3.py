#!/usr/bin/env python

__author__= 'kidus'

import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import Int16
from cv_bridge import CvBridge, CvBridgeError
import cv2
from ros_arduino_msgs.msg import stampedInt


rospy.init_node('capture_detect',anonymous=False)

cap = cv2.VideoCapture('/home/kidus/Desktop/smart_traffic/src/dataset/video3.avi')
cascade_src = '/home/kidus/Desktop/smart_traffic/src/dataset/cars.xml'
car_cascade = cv2.CascadeClassifier(cascade_src)


pub = rospy.Publisher("/lane3_cars", stampedInt, queue_size= 10)


msg = stampedInt()
msg.header.stamp = rospy.Time.now()



while not rospy.is_shutdown():

	ret, frame = cap.read()
	if not (type(frame) == type(None)):
		count_cars = 0
		try:
			gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			cars = car_cascade.detectMultiScale(gray, 1.1, 1)
			for (x,y,w,h) in cars:
				cv2.rectangle(frame,(x,y),(x+w,y+h),(0,0,255),2)
				count_cars = count_cars + 1

			cv2.imshow("Live Feed Camera 3", frame)
			cv2.waitKey(35)
			if cv2.waitKey(1) & 0xFF == ord('q'):
				cv2.destroyAllWindows()
		except CvBridgeError, e:
			print e
		msg.value = count_cars
		pub.publish(msg)
	if ret == False:
		break

cap.release()
cv2.destroyAllWindows()