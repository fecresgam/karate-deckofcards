@ignore
Feature: Add a Card to a Pile

  Scenario:
    Given url apiUrl
    Given path 'deck', deckId, 'pile', pileId, 'add'
    And param cards = cardToAdd
    When method get
    Then status 200
    And match response.success == true
