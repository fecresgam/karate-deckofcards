@component
@deck
Feature: Deck Component Tests

  Background:
    * url apiUrl

  Scenario: [Happy Path] Get non-shuffled deck with Jokers Card By Card
    Given path 'deck', 'new'
    And param jokers_enabled = true
    When method get
    Then status 200
    And match response.success == true
    * def deckId = response.deck_id
    # Spades
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AS'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '3S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '4S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '5S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '6S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '7S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '8S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '9S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '0S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'JS'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'QS'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KS'
    # Diamonds
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AD'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '3D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '4D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '5D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '6D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '7D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '8D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '9D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '0D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'JD'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'QD'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KD'
    # Clubs
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AC'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '3C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '4C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '5C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '6C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '7C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '8C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '9C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '0C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'JC'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'QC'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KC'
    # Hearts
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AH'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '3H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '4H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '5H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '6H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '7H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '8H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '9H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '0H'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'JH'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'QH'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KH'
    # Joker 1
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'X1'
    # Joker 2 is the Last Card
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'X2'
    * match result.response.remaining == 0

  Scenario: [Happy Path] Get non-shuffled partial deck Card By Card
    Given path 'deck', 'new'
    And param cards = 'AS,2S,KS,AD,2D,KD,AC,2C,KC,AH,2H,KH'
    When method get
    Then status 200
    And match response.success == true
    * def deckId = response.deck_id
    # Spades
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AS'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2S'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KS'
    # Diamonds
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AD'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2D'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KD'
    # Clubs
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AC'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2C'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KC'
    # Hearts
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AH'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == '2H'
    # King of Hearts is the Last Card
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KH'
    * match result.response.remaining == 0

  Scenario: [Happy Path] Get non-shuffled partial deck with repeated cards Card By Card
    Given path 'deck', 'new'
    And param cards = 'AS,AS,AS,KD,KD,KH'
    When method get
    Then status 200
    And match response.success == true
    * def deckId = response.deck_id
    # Spades
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AS'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AS'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'AS'
    # Diamonds
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KD'
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KD'
    # King of Hearts is the Last Card
    * def result = call read('classpath:deckofcards/get-a-card.feature')
    * match result.response.cards[0].code == 'KH'
    * match result.response.remaining == 0