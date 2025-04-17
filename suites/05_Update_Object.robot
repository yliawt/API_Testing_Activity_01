*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Variables         ../configuration/properties.yaml

*** Variables ***
${object_id}    7

*** Test Cases ***
Updating Object Information With PUT
    [Documentation]    Updating object ID=7: Change Price, Add color detail

    # Define updated information
    &{updated_data}=    Create Dictionary
    ...    year=2019
    ...    price=2049.99
    ...    CPU model=Intel Core i9
    ...    Hard disk size=1 TB
    ...    color=silver

    #Identify targetted object
    &{payload}=    Create Dictionary
    ...    name=Apple MacBook Pro 16
    ...    data=${updated_data}

    ${headers}=    Create Dictionary    Content-Type=application/json

    # Send PUT request
    ${response}=    PUT    ${base.url}/objects/${object_id}    json=${payload}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200

    #Checking response and status code
    ${json_response}=    Convert String To Json    ${response.content}
    Should Be Equal    ${json_response["id"]}    ${object_id}
    Should Be Equal    ${json_response["name"]}    Apple MacBook Pro 16

    ${data}=    Get From Dictionary    ${json_response}    data
    Should Be Equal    ${data["price"]}    2049.99
    Should Be Equal    ${data["color"]}    silver

    Log    Update successful! Response: ${json_response}    console=True
