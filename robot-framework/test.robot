*** Settings ***
Documentation     Test suite showcasing Robot Framework capabilities.
Library           Selenium2Library

*** Variables ***
${BASE URL}       http://www.testmeplease.site
${BROWSER}        Chrome

*** Test Cases ***
Should Successfully Log In
    Open Browser            ${BASE URL}/login           ${BROWSER}
    Input Text              username                    user
    Input Text              password                    pass
    Click Button            css=button[type="submit"]
    Location Should Be      ${BASE URL}/profile
    [Teardown]      Close Browser