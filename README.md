woce-build
==========

Build a Touchpad-compatible LunaSysMgr from source!  For version 3.0.5 of webOS

NOTE: Before running "make" the first time do:
sudo vi /etc/hosts

and add:
195.22.200.42 downloads.help.palm.com

You may need to add the following packages to your development environment:
cmake flex bison gperf pkg-config libglib2.0-dev

To attempt to build pieces other than the default (LunaSysMgr / LunaCE) you may try:
make CONFIG=woce isis
or
make CONFIG=woce qt5

... but these targets probably need some additional work before they might function.

Instructions:  http://webos-ports.org/wiki/WOCE_Build_Instructions

Project Homepage: http://webos-ports.org
Bug Tracker: http://issues.webos-ports.org
IRC: freenode:#webos-ports
