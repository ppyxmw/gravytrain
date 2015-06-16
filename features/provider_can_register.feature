Feature: Provider can register
  As a Provider
  I want to register
  So that I can sell my Events

  Scenario: A Provider account is created
    Given no Providers exist
    When I am on the registration page
    And I complete the required fields
    And I submit my information
    Then my Provider account is created
    And I see a confirmation message

  Scenario: The T&Cs are not checked
    Given no Providers exist
    When I am on the registration page
    And I have not accepted the T&Cs
    And I submit my information
    Then A Provider account is not created
    And I see an error message
