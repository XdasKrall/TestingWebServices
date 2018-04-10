*** Keywords ***
| Create Default Session
| | Create session | ${SERVICE_NAME} | ${SERVICE_ROOT} | verify=true

| Create Default Headers
| | &{headers}= | Create Dictionary | Content-Type=application/json
| | [Return] | ${headers}

| Should Contain Location A Created Product
| | [Arguments] | ${response}
| | Dictionary Should Contain Key | ${response.headers} | location
| | ${location}= | Get From Dictionary | ${response.headers} | location
| | Should Contain | ${location} | /shop/products/

| Should Not Contain Location A Created Product
| | [Arguments] | ${response}
| | Dictionary Should Not Contain Key | ${response.headers} | location

| Should Contain Error
| | [Arguments] | ${response} | ${error}
| | Dictionary Should Contain Value | ${response} | ${error}