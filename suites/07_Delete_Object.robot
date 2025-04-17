*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Variables ***
${object_id}    6

*** Test Cases ***
Delete Item From List And Verify Removal
    [Documentation]    Delete object(ID=6)
    # Get all 
    ${response}=    GET    ${base.url}/objects
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}    console=True

    # Search object(ID=6)
    ${all_objects}=    Convert String To Json    ${response.content}
    ${item_found}=    Evaluate    next((item for item in ${all_objects} if item["id"] == 6), None)
    Should Not Be Equal    ${item_found}    None

    # Delete object(ID=6)
    ${delete_response}=    DELETE    ${base.url}/objects/6
    Should Be Equal As Strings    ${delete_response.status_code}    200
    Log    ${delete_response.content}    console=True

    # Check if is removed
    ${response}=    GET    ${base.url}/objects
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}    console=True
