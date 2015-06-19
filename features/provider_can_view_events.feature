Feature: I can view Events
  As a Provider
  I want to view my events
  So that I can see them

Scenario: Viewing a provider's events
    Given a registered provider with events
    When I view the provider's events
    Then I see a list of events offered by the provider
