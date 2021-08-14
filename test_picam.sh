#!/bin/bash

gst-launch-1.0 -vv v4l2src device=/dev/video0 ! video/x-raw,width=640,height=480,format=I420,framerate=30/1 ! autovideosink sync=false

exit 0
