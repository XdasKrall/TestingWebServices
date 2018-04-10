*** Settings ***
| Resource  | common/Settings.robot

*** Test Cases ***
| Valid Bank Code
| | [Documentation] | Test to verify that bank info has been got
| |
| | Create Soap Client | ${SERVICE_ROOT}
| | ${response}= | Call Soap Method | getBank | ${BANK_CODE}
| | ${response_as_dictionary}= | Convert To Dictionary | ${response}
| | Response Should Be Equal To Expected | ${response_as_dictionary}

| Invalid Bank Code
| | [Documentation] | Test to verify that server raised an error due to invalid bank code
| |
| | [Template] | Soap Method Should Fault
| | ${INVALID_BANK_CODE_NEGATIVE} | ${EXPECTED_FAULT_NEGATIVE}
| | ${INVALID_BANK_CODE_TEXT} | ${EXPECTED_FAULT_TEXT}
| | ${INVALID_BANK_CODE_FLOAT} | ${EXPECTED_FAULT_FLOAT}
| | ${INVALID_BANK_CODE_EMPTY} | ${EXPECTED_FAULT_EMPTY}
| | ${INVALID_BANK_CODE_BOOL} | ${EXPECTED_FAULT_BOOL}