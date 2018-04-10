*** Variables ***
| ${SERVICE_ROOT} | http://www.thomas-bayer.com/axis2/services/BLZService?wsdl
| ${BANK_CODE} | ${12070000}
| ${INVALID_BANK_CODE_NEGATIVE} | ${-1}
| ${INVALID_BANK_CODE_TEXT} | some bank
| ${INVALID_BANK_CODE_FLOAT} | ${4.5}
| ${INVALID_BANK_CODE_EMPTY} | ${EMPTY}
| ${INVALID_BANK_CODE_BOOL} | ${TRUE}
| ${BANK_NAME} | Deutsche Bank Ld Brandenburg
| ${BIC} | DEUTDEBB160
| ${ORT} | Potsdam
| ${POST_INDEX} | 14405
| ${EXPECTED_FAULT_NEGATIVE} | Keine Bank zur BLZ ${INVALID_BANK_CODE_NEGATIVE} gefunden!
| ${EXPECTED_FAULT_TEXT} | Keine Bank zur BLZ ${INVALID_BANK_CODE_TEXT} gefunden!
| ${EXPECTED_FAULT_FLOAT} | Keine Bank zur BLZ ${INVALID_BANK_CODE_FLOAT} gefunden!
| ${EXPECTED_FAULT_EMPTY} | Keine Bank zur BLZ ${INVALID_BANK_CODE_EMPTY} gefunden!
| ${EXPECTED_FAULT_BOOL} | Keine Bank zur BLZ ${INVALID_BANK_CODE_BOOL} gefunden!