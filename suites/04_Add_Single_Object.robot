*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Test Cases ***

Add new Object into Array
    [Documentation]    Add new object(ID=7) and print as a string
    #Get all object
    ${response}=    GET    ${base.url}/objects
    
    #Define new data to add
    ${New_Data}=    Create Dictionary
    ...    name=Apple MacBook Pro 16
    ...    data=Create Dictionary
    ...    year=2019
    ...    price=1849.99
    ...    CPU model=Intel Core i9
    ...    Hard disk size=1 TB
    
    #Add new data into array
    ${response}    POST    url=${base.url}/objects    json=${new_data}
    Log    ${response.json()}

    #Checking response status code
    Should Be Equal As Strings    ${response.status_code}    200