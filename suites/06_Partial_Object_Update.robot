*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Variables         ../configuration/properties.yaml

*** Variables ***
${object_id}    7

*** Test Cases ***
Partial Update with Object
    #Search for object(ID=7)
    ${response}=    GET    ${base.url}/objects/7
    Log    ${response.content}    console=True

    #update object name
    #show object detail for object(ID=7)

