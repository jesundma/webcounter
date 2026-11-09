*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Reset Counter

*** Test Cases ***
Value of the counter is set to user defined value
    Go To  ${HOME_URL}
    Fill Text  input[name="value"]  10
    Click   button >> text=Aseta
    Get Text  body  *=  nappia painettu 10 kertaa

