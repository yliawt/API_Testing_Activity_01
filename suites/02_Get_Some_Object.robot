*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Test Cases ***

Get Some Objects
    [Documentation]    Retrieve objects(ID=3, ID=5, ID=10) and print as a string

    ${url}=    Set Variable    ${base.url}/objects?id=3&id=5&id=10
    ${response}=    GET    ${url}
    
    Should Be Equal As Strings    ${response.status_code}    200
    Log   ${response.content}   console=True