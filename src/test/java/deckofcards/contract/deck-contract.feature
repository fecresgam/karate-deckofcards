@contract
@deck
Feature: Deck Contract Tests

  Background:
    * url apiUrl
    * def deckSchema =
    """
    {
      "success": '#boolean',
      "deck_id": '#string',
      "remaining": '#number? _ >= 100',
      "shuffled": '#boolean'
    }
    """


  # Check Happy Paths including Responses Schemas
  # get /deck/
  Scenario: [Happy Path] GET /deck/new/
    Given path 'deck', 'new'
    When method get
    Then status 200
    * match response == deckSchema

