*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Test Cases ***

Get Single Object
    [Documentation]    Retrieve object(ID=7) and print as a string

    ${response}=    GET    ${base.url}/objects/7
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}    console=True