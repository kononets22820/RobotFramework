*** Settings ***
Documentation     All the page objects and keywords of landing page
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      open the browser with the url
Suite Setup
Suite Teardown
Test Teardown   Close Browser session
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot


*** Variables ***
@{listofProducts}           Blackberry      Nokia Edge
${country_name}             India


*** Test Cases ***
Validate UnSuccessful Login
     [Tags]      SMOKE      REGRESSION
     LandingPage.Fill the login Form     ${user_name}    ${invalid_password}
     LandingPage.Wait Until Element Is Located In The Page
     LandingPage.verify error message is correct



End to end ecommerce Product validation
    [Tags]      REGRESSION
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout      ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms      ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase



Select the Form and navigate to Child window
    LandingPage.Fill the Login Details and Login Form










































