#!/bin/bash

# @Install:
#  sudo apt-get install xserver-xorg-input-synaptics

# @documentation:
# ftp://www.x.org/pub/X11R7.5/doc/man/man4/synaptics.4.html
#
# @desc:
# This is to configure the touchpad with a Synaptics client on a laptop,
# as it is quite annoying when it's not right. Play with the values to find what you like,
# an run ./touchpad-settings.sh
#
# Generating the file:
# $ synclient -l > touchpad.sh && chmod +x touchpad.sh
#
# Important:
# 1: synclient must be added before every record
# 2: There can be no spaces between the var=value
#

synclient LeftEdge=1574
synclient RightEdge=5368
synclient TopEdge=1352
synclient BottomEdge=4502
synclient FingerLow=30
synclient FingerHigh=50
synclient MaxTapTime=180
synclient MaxTapMove=252
synclient MaxDoubleTapTime=100
synclient SingleTapTimeout=180
synclient ClickTime=100
synclient EmulateMidButtonTime=0
synclient EmulateTwoFingerMinZ=50
synclient EmulateTwoFingerMinW=50
synclient VertScrollDelta=280
synclient HorizScrollDelta=280
synclient VertEdgeScroll=0
synclient HorizEdgeScroll=0
synclient CornerCoasting=0
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient MinSpeed=1
synclient MaxSpeed=1.75
synclient AccelFactor=0.0248918
synclient TouchpadOff=0
synclient LockedDrags=0
synclient LockedDragTimeout=5000
synclient RTCornerButton=2
synclient RBCornerButton=3
synclient LTCornerButton=0
synclient LBCornerButton=0
synclient TapButton1=1
synclient TapButton2=3
synclient TapButton3=0
synclient ClickFinger1=1
synclient ClickFinger2=3
synclient ClickFinger3=2
synclient CircularScrolling=0
synclient CircScrollDelta=0.1
synclient CircScrollTrigger=0
synclient CircularPad=0
synclient PalmDetect=1
synclient PalmMinWidth=8
synclient PalmMinZ=20
synclient CoastingSpeed=1
synclient CoastingFriction=50
synclient PressureMotionMinZ=30
synclient PressureMotionMaxZ=160
synclient PressureMotionMinFactor=1
synclient PressureMotionMaxFactor=1
synclient ResolutionDetect=1
synclient GrabEventDevice=0
synclient TapAndDragGesture=1
synclient AreaLeftEdge=0
synclient AreaRightEdge=0
synclient AreaTopEdge=0
synclient AreaBottomEdge=0
synclient HorizHysteresis=28
synclient VertHysteresis=28
synclient ClickPad=1
synclient RightButtonAreaLeft=3471
synclient RightButtonAreaRight=0
synclient RightButtonAreaTop=4098
synclient RightButtonAreaBottom=0
synclient MiddleButtonAreaLeft=0
synclient MiddleButtonAreaRight=0
synclient MiddleButtonAreaTop=0
synclient MiddleButtonAreaBottom=0

echo "When you are happy with your settings, you are done "
