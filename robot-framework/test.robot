*** Settings ***
Documentation     Test suite showcasing Robot Framework capabilities.
Library           Selenium2Library
Suite Teardown    Close Browser

*** Variables ***
${ALIAS}                            none
${BASE URL}                         http://www.testmeplease.site
${BROWSER}                          Chrome
${BROWSERSTACK OS}                  Windows
${BROWSERSTACK OS VERSION}          10
${BROWSERSTACK BROWSER}             ${BROWSER}
${BROWSERSTACK BROWSER VERSION}     62.0
${BROWSERSTACK RESOLUTION}          1024x768
${DESIRED CAPABILITIES}             SEPARATOR=,
...                                 browserstack.user:%{BROWSERSTACK_USER}
...                                 browserstack.key:%{BROWSERSTACK_KEY}
...                                 os:${BROWSERSTACK OS}
...                                 os_version:${BROWSERSTACK OS VERSION}
...                                 browserName:${BROWSERSTACK BROWSER}
...                                 browser_version:${BROWSERSTACK BROWSER VERSION}
...                                 resolution:${BROWSERSTACK RESOLUTION}
${REMOTE URL}                       http://hub-cloud.browserstack.com/wd/hub

*** Test Cases ***
Should Successfully Log In
    Open Browser            ${BASE URL}/login           ${BROWSER}    ${ALIAS}    ${REMOTE URL}    ${DESIRED CAPABILITIES}
    Input Text              username                    user
    Input Text              password                    pass
    Click Button            css=button[type="submit"]
    Location Should Be      ${BASE URL}/profile

Should Successfully Log Out
    Open Browser            ${BASE URL}/login           ${BROWSER}    ${ALIAS}    ${REMOTE URL}    ${DESIRED CAPABILITIES}
    Input Text              username                    user
    Input Text              password                    pass
    Click Button            css=button[type="submit"]
    Click Link              css=a[href="/logout"]
    Location Should Be      ${BASE URL}/login