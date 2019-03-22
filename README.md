# qatest
MobileAppTesting
Appium library for RobotFramework

Introduction
AppiumLibrary is an appium testing library for RobotFramework.

It uses Appium (version 1.x) to communicate with Android and iOS application similar to how Selenium WebDriver talks to web browser.

AppiumLibrary is modeled after (and forked from) appiumandroidlibrary, but re-implemented to use appium 1.X technologies.

It is fully supported under Python 2.7, python 3.3+ support is still experimental

Documentation
The keyword documentation could be found at Keyword Documentation

Installation
Using pip
The recommended installation method is using pip:

pip install robotframework-appiumlibrary
Using setup.py
setup.py

git clone https://github.com/jollychang/robotframework-appiumlibrary.git
cd robotframework-appiumlibrary
python setup.py install
Directory Layout
demo/
A simple demonstration, with an Android application and RF test suite
doc/
Keyword documentation
src/
Python source code
Usage
To write tests with Robot Framework and AppiumLibrary, AppiumLibrary must be imported into your RF test suite. See Robot Framework User Guide for more information.

As it uses Appium make sure your Appium server is up and running. For how to use Appium please refer to Appium Documentation
