*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Variables ***
${object_id}    6

*** Test Cases ***
Delete Item From List And Verify Removal
    [Documentation]    Delete object(ID=${object_id}) and verify it is removed

    # Get all objects
    ${response}=    GET    ${base.url}/objects
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}    console=True
    ${all_objects}=    Convert String To Json    ${response.content}
    
    # Get item by ID using keyword
    ${item_found}=    Get Object From List By ID    ${all_objects}    ${object_id}
    Log    ${item_found}
    Should Not Be Equal    ${item_found}    None

    # Delete object(ID=${object_id})
    ${delete_response}=    DELETE    ${base.url}/objects/${object_id}
    Should Be Equal As Strings    ${delete_response.status_code}    200
    Log    ${delete_response.content}    console=True

    # Verify item is removed
    ${response}=    GET    ${base.url}/objects
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}    console=True

    ${all_objects}=    Convert String To Json    ${response.content}
    ${item_found}=     Set Variable    None
    FOR    ${item}    IN    @{all_objects}
        ${item_id}=    Get From Dictionary    ${item}    id
        Run Keyword If    ${item_id} == ${object_id}    Set Variable    ${item_found}    ${item}
    END
    Should Be Equal    ${item_found}    None

*** Keywords ***
Get Object From List By ID
    [Arguments]    ${objects}    ${target_id}
    ${target_id}=    Convert To String    ${target_id}
    FOR    ${item}    IN    @{objects}
        ${item_id}=    Get From Dictionary    ${item}    id
        ${item_id}=    Convert To String    ${item_id}
        Run Keyword If    '${item_id}' == '${target_id}'    Return From Keyword    ${item}
    END
    Return From Keyword    None