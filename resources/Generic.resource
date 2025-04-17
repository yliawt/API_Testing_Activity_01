*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Variables         ../configuration/properties.yaml

*** Variables ***
${object_id}

*** Keywords ***

Get All Objects
    ${response}=    GET    ${base.url}/objects
    Should Be Equal As Strings    ${response.status_code}    200
    Log     ${response.content}   console=True

Get Single Object    [Arguments]    ${object_id}
    ${response}=    GET    ${base.url}/objects/${object_id}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}    console=True

