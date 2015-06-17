Feature: I can view my Profile
  As a Provider
  I want to see information I have registered
  So that I know the process was successful and double check the details

  Scenario: A Provider's details are displayed
    Given a Provider registers
    When I view the Provider
    Then I see their details
