*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Variables         ../configuration/properties.yaml
Resource           ../resources/Generic.resource

*** Test Cases ***
Get Single Object
    [Documentation]    Retrieve object(ID=7) and print as a string

    Generic.Get Single Object    7  