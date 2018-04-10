*** Settings ***
| Resource | common/Settings.robot

*** Test Cases ***
| Valid Data
| | [Documentation] | Test to verify that a product is successfully created with valid data
| |
| | Create Default Session
| | &{data}= | Create Dictionary | name=${NAME_PRODUCT} | price=${PRICE_PRODUCT} | category_url=${CATEGORY_URL_PRODUCT} | vendor_url=${VENDOR_URL_PRODUCT}
| | &{headers}= | Create Default Headers
| | ${response}= | Post Request | ${SERVICE_NAME} | /shop/products/ | data=${data} | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 201
| | ... | Expected a status code of 201 but got ${response.status_code} | values=False
| | Should Contain Location A Created Product | ${response}

| Invalid Price
| | [Documentation] | Test to verify that a product isn't successfully created with invalid data
| |
| | Create Default Session
| | &{data}= | Create Dictionary | name=${NAME_PRODUCT} | price=${INVALID_PRICE_PRODUCT} | category_url=${CATEGORY_URL_PRODUCT}| vendor_url=${VENDOR_URL_PRODUCT}
| | &{headers}= | Create Default Headers
| | ${response}= | Post Request | ${SERVICE_NAME} | /shop/products/ | data=${data} | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 400
| | ... | Expected a status code of 400 but got ${response.status_code} | values=False
| | Should Not Contain Location A Created Product | ${response}
| | Should Contain Error | ${response.json()} | ${PRICE_NOT_NUMBER_ERROR}

| Without Data
| | [Documentation] | Test to verify that a product isn't successfully created without data
| |
| | Create Default Session
| | &{headers}= | Create Default Headers
| | ${response}= | Post Request | ${SERVICE_NAME} | /shop/products/ | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 400
| | ... | Expected a status code of 400 but got ${response.status_code} | values=False
| | Should Not Contain Location A Created Product | ${response}
| | Should Contain Error | ${response.json()} | ${NO_DATA_ERROR}