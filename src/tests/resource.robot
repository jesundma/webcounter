*** Settings ***
Library  Browser
Library  Process

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     500ms
${HOME_URL}  http://${SERVER}
${BROWSER}   chromium
${HEADLESS}  false

*** Keywords ***
Open And Configure Browser
    IF  $HEADLESS == 'true'
        New Browser  browser=${BROWSER}  headless=True
    ELSE
        New Browser  browser=${BROWSER}  headless=False  slowMo=${DELAY}
    END
    New Context
    New Page  about:blank

Reset Counter
    ${result}=    Run Process    curl    --fail    --silent    --show-error
    ...    --request    POST    ${HOME_URL}/reset
    Should Be Equal As Integers    ${result.rc}    0