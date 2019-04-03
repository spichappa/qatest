                                                  MobileTestAutomationProject

MobileAppTesting Prerequisites:

- Windows 10 Platform 

- Android Studio 3.3

- Python27

- pip command installations

- Node.jz 10.15.3 LTS

- appium 1.6.5

- Appium library for RobotFramework

Introduction
AppiumLibrary is an appium testing library for RobotFramework.
It uses Appium (version 1.x) to communicate with Android and iOS application similar to how Selenium WebDriver talks to web browser.
AppiumLibrary is modeled after appiumandroidlibrary, but re-implemented to use appium 1.X technologies.
It is fully supported under Python 2.7.

Documentation
Architecture Detailed documentation can be found in this path:
https://www.xoriant.com/blog/product-engineering/robot-framework-mobile-test-automation.html

The keyword documentation of RobotFramework and AppiumFramework could be found here:
http://robotframework.org/robotframework/3.0/RobotFrameworkUserGuide.html
http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Open%20Application

Installation Steps: (steps to perform via cmd prompt (Run As Administrator):

C:\windows\system32>npm uninstall -g appium
removed 576 packages in 68.936s

C:\windows\system32>npm cache clean --force
npm WARN using --force I sure hope you know what you are doing.

C:\windows\system32>npm install -g appium@1.6.5

Use the below cmd to resolve the above .net Framework dependency issue:

C:\windows\system32>npm install --global --production windows-build-tools

Verify whether the appium server is up & running now using the below cmd:

C:\> netstat -an | findstr "4723"
  TCP    0.0.0.0:4723           0.0.0.0:0              LISTENING

Then go to python directory and execute the below commands:
python setup.py install
easy_install pip
pip install distributor
pip install robotframework
pip install robotframework-appiumlibrary

=======================
Set the ANDROID_HOME variable to C:\Users\Sindhu_Pichappa\AppData\Local\Android\Sdk from C:\Users\Sindhu_Pichappa\AppData\Local\Android\Sdk\platforms
Then in the cmd prompt also run the below cmd, go to python path and set the below path once:
C:\Users\Sindhu_Pichappa\.windows-build-tools\python27\Scripts> set PATH=$ANDROID_HOME/build-tools/$(ls -tr $ANDROID_HOME/build-tools/
----
PATH values such as python27, etc are to be set as like below in your system's environment variable after installing all the necessary component list:

C:\Users\Sindhu_Pichappa\AppData\Local\Android\Sdk\platform-tools;"C:\Users\Sindhu_Pichappa\.windows-build-tools\Python27;C:\Users\Sindhu_Pichappa\.windows-build-tools\Python27\Scripts;C:\Users\Sindhu_Pichappa\.windows-build-tools\Python27\DLLs;C:\Users\Sindhu_Pichappa\.windows-build-tools\Python27\Lib;C:\Python27\Lib\lib-tk";C:\Users\Sindhu_Pichappa\AppData\Local\Android\Sdk\platforms;C:\Program Files\nodejs\;C:\Program Files (x86)\Java\jre1.8.0_201\bin;C:\Program Files\Android\Android Studio\bin;C:\Program Files\dotnet\;C:\Windows\Microsoft.NET\Framework64\v4.0.30319;C:\Users\Sindhu_Pichappa\AppData\Local\Android\Sdk;C:\Users\Sindhu_Pichappa\.windows-build-tools\python27;C:\Program Files\nodejs\node_modules\npm\node_modules\npm-lifecycle\node-gyp-bin;C:\Users\Sindhu_Pichappa\AppData\Roaming\npm\node_modules\windows-build-tools\node_modules\.bin;C:\Users\Sindhu_Pichappa\AppData\Roaming\npm\node_modules\.bin;C:\Users\Sindhu_Pichappa\AppData\Local\Microsoft\WindowsApps;C:\Users\Sindhu_Pichappa\AppData\Roaming\npm

Directory Layout 

qatest/

  - MedianCalculator.robot
  
  A simple automation suite written in RobotFramework for an Android application using its .apk file.
  
qatest/testresults/
  
  - log.html
  - output.html
  - report.xml
  - MedianCalculator_TestResults.docx
  
  Above files are the tested result performed under the Engineer's System which is placed for reference.

qatest/

  - README.md
  
  (current file)

Usage

To automate mobile application tests with Robot Framework and AppiumLibrary, AppiumLibrary must be imported into your RF test suite.
As it uses Appium make sure your Appium server is up and running.

On the other side, use the below links to install the android studio app and node.js
Create Project using android app (make sure the .apk file is under the respective 'platform-tools' directory of android studio and set up a virtual android device

cmd prompt (to check the list of running devices in the computer) -> avd devices

Above cmd will display the device name

Now Build & Run the project which will display the mobile emulator along with the app installed.
Please find the attached screenshot for ease of understanding of the test suite set up and its working.

