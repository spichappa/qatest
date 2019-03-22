*** Settings ***
Documentation  Android Automation for Mobile Application MedianCalculator - This suite contains all variables, keywords and testcases required for Verifying a mobileApp
...     [Author]  Sindhu Pichappa

Library           AppiumLibrary    20

Suite Setup  Open Android Calculator Application
Suite Teardown  Close Application
Test Setup  Launch Application
Test Teardown  Quit Application

*** Variables ***
${REMOTE_URL}                   http://localhost:4723/wd/hub
${PLATFORM_NAME}          Android
${PLATFORM_VERSION}    7.1.1
${DEVICE_NAME}         Nexus One API 25
${APP}                 C:\\Users\\Sindhu_Pichappa\\AppData\\Local\\Android\\Sdk\\platform-tools\\CalculaMediaFinal.apk
#Specify your respective file path of .apk file
${APP_PACKAGE}         com.exemplo.calculamediafinal
${APP_ACTIVITY}        com.exemplo.calculamediafinal.MediaActivity
${InputNumber1_id}     id=txtNota1
${InputNumber2_id}     id=txtNota2
${InputNumber3_id}     id=txtNota3
${CalculatorButton_id}      id=btnCalcular
${MedianFinalValue_id}		id=txtMediaFinal

${TotalNumberOfInputs}   3
${NoData}   ${EMPTY}

${TIME OUT}         20 sec
${Retry_Int}          3 sec

*** Keywords ***
Open Android Calculator Application
	[Documentation]    Keyword to Open the Android Median Calculator App via Appium
    Open Application  ${REMOTE_URL}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}  deviceName=${DEVICE_NAME} app=${APP}  automationName=appium  appPackage=${APP_PACKAGE}   appActivity=${APP_ACTIVITY}

Verify All Page Elements Are Present and Clear the Input Field Values
	[Documentation]    Keyword to verify all the page elements of Median Calculator App are present and reset their values
	Page Should Contain Element   ${InputNumber1_id}
	Page Should Contain Element   ${InputNumber2_id}
	Page Should Contain Element   ${InputNumber3_id}
	Page Should Contain Element   ${CalculatorButton_id}
	Page Should Contain Element   ${MedianFinalValue_id}
	Clear Text   ${InputNumber1_id}
	Clear Text   ${InputNumber2_id}
	Clear Text   ${InputNumber3_id}

Populate Input Field Values    [Arguments]   ${input_val01}    ${input_val02}   ${input_val03}
	[Documentation]    Keyword to populate data inputs required for the Android Median Calculator App
	Input Value       ${InputNumber1_id}                ${input_val01}
	Input Value       ${InputNumber2_id}                ${input_val02}
	Input Value       ${InputNumber3_id}                ${input_val03}
	Click Element     ${CalculatorButton_id}

Calculate the average of the input numbers    [Arguments]   ${input_val01}    ${input_val02}   ${input_val03}
	[Documentation]    Keyword to calculate average of three numbers
	${findSumOfAll3FieldInputValues}=   Evaluate   ${input_val01}+${input_val02}+${input_val03}
	${findAverageVal}=   Evaluate   ${findSumOfAll3FieldInputValues}/${TotalNumberOfInputs}
	${finalVal}=	Convert To String   ${findAverageVal}
	[return]	${findAverageVal}
	
Perform Median Calculating Operation with Valid Inputs  [Arguments]   ${actual_AvgValue}
	[Documentation]    Keyword to perform median value calculation through the app and verifying its result for valid inputs
	Page Should Contain Element   ${MedianFinalValue_id}
    ${getCalculatedMedianVal}=    Get Text   ${MedianFinalValue_id}
	${getCalculatedMedianResult}=	Convert To String    ${getCalculatedMedianVal}
	#Should Be Equal as Strings   abs(${getCalculatedMedianResult})  ${actual_AvgValue}
	Should Be Equal As Numbers	${getCalculatedMedianResult}	${actual_AvgValue}	precision=0	
	Log   ${getCalculatedMedianResult}   console=yes
	[return]	${getCalculatedMedianResult}

Perform Median Calculating Operation for Negative Case
	[Documentation]    Keyword to perform median value calculation through the app and verifying its result for Invalid inputs
	Page Should Not Contain Element   ${InputNumber1_id}
	Page Should Not Contain Element   ${InputNumber2_id}
	Page Should Not Contain Element   ${InputNumber3_id}

*** Test Cases ***
MediaCalclulatorAndroid Application TestCase01
    [Documentation]    TestCase to Verify all page elements are present and clear the field values
    [Tags]    TC01   smoke
	Verify All Page Elements Are Present and Clear the Input Field Values

MediaCalclulatorAndroid Application TestCase02
	[Documentation]    TestCase to verify positive case given all fields values and check Median Calculation is working
    [Tags]    TC02   core
	${InputNumber1_Val}=  Set Variable   5
	${InputNumber2_Val}=  Set Variable   3
	${InputNumber3_Val}=  Set Variable   2   
	Populate Input Field Values   ${InputNumber1_Val}   ${InputNumber2_Val}   ${InputNumber3_Val}
	${get_AvgVal}=		Calculate the average of the input numbers   ${InputNumber1_Val}   ${InputNumber2_Val}   ${InputNumber3_Val}
	Perform Median Calculating Operation with Valid Inputs   ${get_AvgVal}

MediaCalclulatorAndroid Application TestCase03
	[Documentation]    TestCase to verify positive case given all fields values and check Median Calculation is working
    [Tags]    TC03   full
	${InputNumber1_Val}=  Set Variable    1213456789009876512134567890098765121345678900987651213456789009876512134567890098765121345678900987651213456789009876512134567890098765 
	${InputNumber2_Val}=  Set Variable  1213456789009876512134567890098765121345678900987651213456789009876512134567890098765121345678900987651213456789009876512134567890098766
	${InputNumber3_Val}=  Set Variable    1213456789009876512134567890098765121345678900987651213456789009876512134567890098765121345678900987651213456789009876512134567890098767
	Populate Input Field Values   ${InputNumber1_Val}   ${InputNumber2_Val}   ${InputNumber3_Val}
	${get_AvgVal}=		Calculate the average of the input numbers   ${InputNumber1_Val}   ${InputNumber2_Val}   ${InputNumber3_Val}
	Perform Median Calculating Operation with Valid Inputs   ${get_AvgVal}


MediaCalclulatorAndroid Application TestCase04
	[Documentation]    TestCase to verify positive case given all fields values and check Median Calculation is working
    [Tags]    TC04   full
	${InputNumber1_Val}=  Set Variable   0
	${InputNumber2_Val}=  Set Variable   0
	${InputNumber3_Val}=  Set Variable   0   
	Populate Input Field Values   ${InputNumber1_Val}   ${InputNumber2_Val}   ${InputNumber3_Val}
	${get_AvgVal}=		Calculate the average of the input numbers   ${InputNumber1_Val}   ${InputNumber2_Val}   ${InputNumber3_Val}
	Perform Median Calculating Operation with Valid Inputs   ${get_AvgVal}

MediaCalclulatorAndroid Application TestCase05
	[Documentation]    TestCase to input valid 1 digit numbers in any 2 fields and by keeping empty value in 1 field and check Median Calculation fails
    [Tags]    TC05  core
	${InputNumber1_Val}=  Set Variable   4
	${InputNumber2_Val}=  Set Variable   2
	${InputNumber3_Val}=  Set Variable   ${NoData}
	Populate Input Field Values   ${InputNumber1_Val}   ${InputNumber2_Val}   ${NoData}
	Perform Median Calculating Operation for Negative Case
    
	
	
	
