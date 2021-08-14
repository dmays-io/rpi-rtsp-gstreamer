#!/bin/bash

#--------------------------------------
# Purpose:	GStreamer RTSP Server Install
# System:	Raspbian GNU/Linux 10
# Author: 	David Mays
# Email: 	david@davidmays.io
# Date:		8/14/2021
#-------------------------------------

echo "######################################"
echo "####	Installing Libraries	####"
echo "######################################"
apt-get install gstreamer1.0-tools -y
apt-get install libgstrtspserver-1.0-dev gstreamer1.0-rtsp -y
sudo apt-get install git build-essential autoconf automake autopoint libtool pkg-config -y
sudo apt-get install gtk-doc-tools libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y


echo "##############################################"
echo "####	Cloning gst-rtsp-server		####"
echo "##############################################"
git clone https://github.com/GStreamer/gst-rtsp-server.git
cd gst-rtsp-server

echo "######################################"
echo "####	Building test-launch	####"
echo "######################################"
gstVer=$(pkg-config --modversion gstreamer-rtsp-server-1.0)
echo "Checking out older version " $gstVer
git checkout $gstVer
cd examples
gcc -o test-launch  test-launch.c  `pkg-config --cflags --libs gstreamer-rtsp-server-1.0`
echo "Installation Complete!"


