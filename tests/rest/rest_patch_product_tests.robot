*** Settings ***
| Resource | common/Settings.robot

*** Test Cases ***
| Valid Price
| | [Documentation] | Test to verify that price of a product is successfully patched with valid data
| |
| | Create Default Session
| | &{data}= | Create Dictionary | name=${NAME_PRODUCT} | price=${PRICE_PRODUCT} | category_url=${CATEGORY_URL_PRODUCT} | vendor_url=${VENDOR_URL_PRODUCT}
| | ${location}= | Post A Product With Data | ${data}
| | &{headers}= | Create Default Headers
| | ${patch_data}= | Create Dictionary | price=${VALID_NEW_PRICE_PRODUCT}
| | ${response}= | Patch Request | ${SERVICE_NAME} | ${location} | data=${patch_data} | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 200
| | ... | Expected a status code of 200 but got ${response.status_code} | values=False
| | &{expected_data}= | Set Variable | ${data}
| | Set To Dictionary | ${expected_data} | price | ${VALID_NEW_PRICE_PRODUCT}
| | 
| | Should Be Equal | ${response.json()} | ${expected_data}

| Invalid Name
| | [Documentation] | Test to verify that name of a product won't be patched as name is not string
| |
| | Create Default Session
| | &{data}= | Create Dictionary | name=${NAME_PRODUCT} | price=${PRICE_PRODUCT} | category_url=${CATEGORY_URL_PRODUCT} | vendor_url=${VENDOR_URL_PRODUCT}
| | ${location}= | Post A Product With Data | ${data}
| | &{headers}= | Create Default Headers
| | ${patch_data}= | Create Dictionary | name=${INVALID_NEW_NAME_PRODUCT}
| | ${response}= | Patch Request | ${SERVICE_NAME} | ${location} | data=${patch_data} | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 400
| | ... | Expected a status code of 400 but got ${response.status_code} | values=False
| | Should Contain Error | ${response.json()} | ${NAME_NOT_STRING_ERROR}

| Invalid Field
| | [Documentation] | Test to verify that product won't be patched as we post not allowed field
| |
| | Create Default Session
| | &{data}= | Create Dictionary | name=${NAME_PRODUCT} | price=${PRICE_PRODUCT} | category_url=${CATEGORY_URL_PRODUCT} | vendor_url=${VENDOR_URL_PRODUCT}
| | ${location}= | Post A Product With Data | ${data}
| | &{headers}= | Create Default Headers
| | ${patch_data}= | Create Dictionary | color=${COLOR}
| | ${response}= | Patch Request | ${SERVICE_NAME} | ${location} | data=${patch_data} | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 400
| | ... | Expected a status code of 400 but got ${response.status_code} | values=False
| | Should Contain Error | ${response.json()} | ${NOT_ALLOWED_ERROR}

*** Keywords ***
| Post A Product With Data
| | [Arguments] | ${data}
| | &{headers}= | Create Dictionary | Content-Type=application/json
| | ${response}= | Post Request | ${SERVICE_NAME} | /shop/products/ | data=${data} | headers=${headers}
| |
| | Should Be Equal As Numbers | ${response.status_code} | 201
| | ... | Expected a status code of 201 but got ${response.status_code} | values=False
| | Should Contain Location A Created Product | ${response}
| | [Return] | ${response.headers['location']}