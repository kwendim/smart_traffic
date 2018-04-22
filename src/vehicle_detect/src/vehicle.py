#!/usr/bin/env python

__author__= 'kidus'

import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import String
from cv_bridge import CvBridge, CvBridgeError
import cv2


def detect_vehicle(data):
	count_cars = 0
	try:
		frame = bridge.imgmsg_to_cv2(data, 'passthrough')
		gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
		cars = car_cascade.detectMultiScale(gray, 1.1, 1)
		for (x,y,w,h) in cars:
			cv2.rectangle(frame,(x,y),(x+w,y+h),(0,0,255),2)
			count_cars = count_cars + 1

		cv2.imshow("Live Feed", frame)
		if cv2.waitKey(1) & 0xFF == ord('q'):
			cv2.destroyAllWindows()
	except CvBridgeError, e:
		print e	
	pub.publish(str(count_cars))




cascade_src = '/home/kidus/Desktop/smart_traffic/src/vehicle_detect/src/cars.xml'
#video_src = 'dataset/video1.avi'
car_cascade = cv2.CascadeClassifier(cascade_src)

bridge = CvBridge()
rospy.init_node('vehicle_detect',anonymous=False)
sub = rospy.Subscriber("/camera1", Image, detect_vehicle)
# sub = rospy.Subscriber("/camera2", Image, detect_vehicle_2)
pub = rospy.Publisher("/lane1_cars", String, queue_size= 1)




if __name__=='__main__':
	rospy.spin()


