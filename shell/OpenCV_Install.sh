#!/bin/bash

######### README ########
# Script based on Geekette86 (http://about.me/geekette86 ) Work
# Ooriginal post ( http://on.fb.me/1vYeJ1a )
# TXT file link( http://bit.ly/1uXABTp ) 
# Script created and tested under Ubuntu 14.04


# Install dependencies
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm libtiff4-dev libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev

# Download the OpenCV 2.4.9
wget -c http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip

# Extract the zip file

unzip opencv-2.4.9.zip && cd opencv-2.4.9

# Building it
mkdir build && cd build && cmake -D WITH_QT=ON -D WITH_XINE=ON -D WITH_OPENGL=ON -D WITH_TBB=ON -D BUILD_EXAMPLES=ON ..

# I had a problem loading the libGL.so lib, I solved it by creating a symlink to "/usr/lib/x86_64-linux-gnu/mesa/libGL.so.1.2.0"
if [ ! -f /usr/lib64/fglrx/fglrx-libGL.so.1.2 ]; then
    sudo ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1.2.0 /usr/lib64/fglrx/fglrx-libGL.so.1.2
fi

sudo make && sudo make install

# No need to do this, the conf file Inludes all confs under /etc/ld.so.conf.d/* and libc.conf already have that value
#sudo gedit /etc/ld.so.conf
#/usr/local/lib


# cat /etc/ld.so.conf.d/libc.conf 
# libc default configuration
# /usr/local/lib

# sudo ldconfig

# you can test if it is work by going to  OpenCV/build/bin and run one of the examples there
# NB: some packages u can just let it go and  not installed it depends in ur needs