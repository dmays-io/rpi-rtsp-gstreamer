#!/bin/bash

./test-launch --gst-debug=3 "( v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480, framerate=30/1 ! videoconvert ! queue ! x264enc ! rtph264pay name=pay0 pt=96 )"

exit 0
