*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../configuration/properties.yaml
Resource           ../resources/Generic.resource

*** Test Cases ***

Get All Objects
    [Documentation]    Retrieve all objects and print as a string
    Generic.Get All Objects