#!/usr/bin/env python

__author__= 'kidus'

import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import String
from cv_bridge import CvBridge, CvBridgeError
import cv2


rospy.init_node('Vidcap',anonymous=False)
bridge = CvBridge()
image_publisher = rospy.Publisher("/camera1", Image, queue_size= 1)
cap = cv2.VideoCapture('/home/kidus/Desktop/smart_traffic/src/camera_capture/src/dataset/video2.avi')



while not rospy.is_shutdown():


	ret, frame = cap.read()
	if not (type(frame) == type(None)):
		camera1_msg = bridge.cv2_to_imgmsg(frame)
		image_publisher.publish(camera1_msg)
		if cv2.waitKey(33) == 27:
			break
	if ret == False:
		break	
cap.release()
cv2.destroyAllWindows()