*** Settings ***
Documentation        Representação do componente toast

Library        Browser

*** Keywords ***
Verify Toaster
    [Arguments]        ${expected_messege}
    Wait For Elements State     
    ...    css=.Toastify__toast-body div >> text=${expected_messege}
    ...    visible    5

    Wait For Elements State
    ...    css=.Toastify__toast-body div
    ...    detached    10