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
    And def deckId = response.deck_id
    # Spades
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AS'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '3S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '4S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '5S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '6S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '7S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '8S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '9S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '0S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'JS'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'QS'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KS'
    # Diamonds
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AD'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '3D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '4D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '5D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '6D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '7D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '8D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '9D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '0D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'JD'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'QD'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KD'
    # Clubs
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AC'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '3C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '4C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '5C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '6C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '7C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '8C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '9C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '0C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'JC'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'QC'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KC'
    # Hearts
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AH'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '3H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '4H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '5H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '6H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '7H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '8H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '9H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '0H'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'JH'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'QH'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KH'
    # Joker 1
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'X1'
    # Joker 2 is the Last Card
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'X2'
    Then match result.response.remaining == 0

  Scenario: [Happy Path] Get non-shuffled partial deck Card By Card
    Given path 'deck', 'new'
    And param cards = 'AS,2S,KS,AD,2D,KD,AC,2C,KC,AH,2H,KH'
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    # Spades
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AS'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2S'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KS'
    # Diamonds
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AD'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2D'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KD'
    # Clubs
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AC'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2C'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KC'
    # Hearts
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AH'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == '2H'
    # King of Hearts is the Last Card
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KH'
    Then match result.response.remaining == 0

  Scenario: [Happy Path] Get non-shuffled partial deck with repeated cards Card By Card
    Given path 'deck', 'new'
    And param cards = 'AS,AS,AS,KD,KD,KH'
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    # Spades
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AS'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AS'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'AS'
    # Diamonds
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KD'
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KD'
    # King of Hearts is the Last Card
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then match result.response.cards[0].code == 'KH'
    Then match result.response.remaining == 0