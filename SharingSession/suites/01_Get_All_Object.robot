*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Test Cases ***

Get All Objects
    [Documentation]    Retrieve all objects and print as a string

    ${response}=    GET    ${base.url}/objects
    Should Be Equal As Strings    ${response.status_code}    200
    Log     ${response.content}   console=True