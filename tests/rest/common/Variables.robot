*** Variables ***
| ${SERVICE_ROOT} | https://api.predic8.de
| ${SERVICE_NAME} | predic8
| ${NAME_PRODUCT} | Wildberries
| ${PRICE_PRODUCT} | ${4.99}
| ${INVALID_PRICE_PRODUCT} | ${null}
| ${CATEGORY_URL_PRODUCT} | /shop/categories/Fruits
| ${VENDOR_URL_PRODUCT} | /shop/vendors/672
| ${PRICE_NOT_NUMBER_ERROR} | child "Price" fails because ["Price" must be a number]
| ${NO_DATA_ERROR} | "Product" must be an object
| ${VALID_NEW_PRICE_PRODUCT} | ${1.99}
| ${INVALID_NEW_NAME_PRODUCT} | ${45}
| ${COLOR} | blue
| ${NAME_NOT_STRING_ERROR} | child "ProductName" fails because ["ProductName" must be a string]
| ${NOT_ALLOWED_ERROR} | "color" is not allowed