*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Variables ***
${object_id}    7

*** Test Cases ***
Partial Update Object Name Using PATCH
    [Documentation]    Partially update object ID=7 by changing the name only.

    # View original targetted data
    ${response}=    GET    ${base.url}/objects/${object_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    Original Object: ${response.content}    console=True

    # Updated information for target data
    &{payload}=    Create Dictionary
    ...    name=Apple MacBook Pro 16 (Updated Name)

    ${headers}=    Create Dictionary    Content-Type=application/json

    # Patch Request
    ${patch_response}=    PATCH    ${base.url}/objects/${object_id}    json=${payload}    headers=${headers}
    Should Be Equal As Integers    ${patch_response.status_code}    200

    # check if is updated
    ${updated_response}=    GET    ${base.url}/objects/${object_id}
    ${updated_json}=       Convert String To Json    ${updated_response.content}
    Should Be Equal        ${updated_json["name"]}    Apple MacBook Pro 16 (Updated Name)
    Log    Updated Object: ${updated_json}    console=True

