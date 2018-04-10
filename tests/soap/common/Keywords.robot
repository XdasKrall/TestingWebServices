*** Keywords ***
| Response Should Be Equal To Expected
| | [Arguments] | ${response}
| | ${expected_response}= | Create Dictionary | bezeichnung=${BANK_NAME} | bic=${BIC} | ort=${ORT} | plz=${POST_INDEX}
| | Should Be Equal | ${response} | ${expected_response}

| Soap Method Should Fault
| | [Arguments] | ${invalid_bank_code} | ${expected_fault}
| | Create Soap Client | ${SERVICE_ROOT}
| | ${fault}= | Call Soap Method Expecting Fault | getBank | ${invalid_bank_code}
| | Should Be Equal As Strings | ${fault.faultstring} | ${expected_fault}