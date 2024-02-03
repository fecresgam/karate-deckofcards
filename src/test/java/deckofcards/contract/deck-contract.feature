@contract
@deck
Feature: Deck Contract Tests

  Background:
    * url apiUrl

  # Check Happy Paths including Responses Schemas
  # get /deck/
  Scenario: [Happy Path] GET /deck/new/
    Given path 'deck', 'new'
    When method get
    Then status 200

