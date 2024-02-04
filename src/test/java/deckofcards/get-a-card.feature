@ignore
Feature: Get a card

  Scenario:
    Given url apiUrl
    Given path 'deck', deckId , 'draw'
    And param count = 1
    When method get
    Then status 200
    And match response.success == true