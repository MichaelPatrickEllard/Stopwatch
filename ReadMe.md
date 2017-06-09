
StopWatch

Sample code to illustrate the use of NSTimer and CADisplayLink for my students at UCSC Extension.

This project was written for use with Xcode 8.3 and Swift 3.1

The code has two screens:

- NSTViewController is used to illustrate the use of an NSTimer (a.k.a. Timer in Swift).  NSTViewController is implemented in two files:  NSTViewController.swift file has the main implementation.  NSTViewController+Extensions.swift has code that shows the timer being invalidated when the user leaves the screen and recreated when the user returns to the screen. The view controller definition is broken up into two parts since that made sense for the sequence of the material in the class slides.  

- CADLViewController is used to illustrate the use of a CADisplayLink.

This simple demo code should work on any iOS device, real or simulated.

To test the project download it, build it and run it.  

Possible future upgrades:

- The NSTimer is invalidated when viewDidDisappear is called, but it is not explicitly suspended if the user leaves the app altogether.  This is sufficient for a simple demo app such as this one, but it would be good to upgrade this.  CADisplayLink instances automatically stop firing if the user leaves the app, so probably nothing needs to be done there.

©2017 Michael Patrick Ellard

