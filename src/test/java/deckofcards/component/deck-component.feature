@contract
@deck
Feature: Deck Component Tests

  Background:
    * url apiUrl


  # Check Happy Paths
  # Get non-shuffled deck with Jokers Card By Card
  Scenario: [Happy Path] Get Unshuffled deck Card By Card
    Given path 'deck', 'new'
    And param jokers_enabled = true
    When method get
    Then status 200
    And match response.success == true
    * def deckId = response.deck_id
    ## AS
    Given path 'deck', deckId , 'draw'
    And param count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.cards[0].code == 'AS'
    # 2S
    Given path 'deck', deckId , 'draw'
    And param count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.cards[0].code == '2S'
