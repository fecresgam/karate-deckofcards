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
      "remaining": '#number? _ >= 0',
      "shuffled": '#boolean'
    }
    """
    * def drawSchema =
    """
    {
      "success": '#boolean',
      "deck_id": '#string',
      "cards": '#array',
      "remaining": '#number? _ >= 0',
    }
    """
    * def cardSchema =
    """
    {
      "code": "#regex (([2-9]|[A0JQK])[SDCH])|(X[12])",
      "image": "#string",
      "images": {
        "svg": "#string",
        "png": "#string"
      },
      "value": "#? _ == 'ACE' || _ == '2' || _ == '3' || _ == '4' || _ == '5' || _ == '6' || _ == '7' || _ == '8' || _ == '9' || _ == '10' || _ == 'JACK' || _ == 'QUEEN' || _ == 'KING' || _ == 'JOKER'",
      "suit": "#? _ == 'SPADES' || _ == 'DIAMONDS' || _ == 'CLUBS' || _ == 'HEARTS' || _ == 'BLACK' || _ == 'RED'",
    }
    """

  # Check Happy Paths including Responses Schemas
  # GET /deck/...
  Scenario: [Happy Path] GET /deck/new/ - Standard deck
    Given path 'deck', 'new'
    When method get
    Then status 200
    And match response == deckSchema
    And match response.success == true
    And match response.shuffled == false
    And match response.remaining == 52

  Scenario: [Happy Path] GET /deck/new/shuffle/ - Shuffled deck
    Given path 'deck', 'new', 'shuffle'
    When method get
    Then status 200
    And match response == deckSchema
    And match response.success == true
    And match response.shuffled == true

  Scenario: [Happy Path] GET /deck/new/ - Several Decks
    Given path 'deck', 'new'
    And param deck_count = 3
    When method get
    Then status 200
    And match response == deckSchema
    And match response.success == true
    And match response.shuffled == false
    And match response.remaining == (52 * 3)

  Scenario: [Happy Path] GET /deck/new/ - With Jokers
    Given path 'deck', 'new'
    And param jokers_enabled = true
    When method get
    Then status 200
    And match response == deckSchema
    And match response.success == true
    And match response.shuffled == false
    And match response.remaining == 54

  Scenario: [Happy Path] GET /deck/new/ - Partial Deck
    Given path 'deck', 'new'
    And param cards = 'AS,2S,KS,AD,2D,KD,AC,2C,KC,AH,2H,KH'
    When method get
    Then status 200
    And match response == deckSchema
    And match response.success == true
    And match response.shuffled == false
    And match response.remaining == 12

  Scenario: [Happy Path] GET /deck/{{deckId}}/ - Already existing deck
    Given path 'deck', 'new'
    When method get
    Then status 200
    And match response.success == true
    * def deckId = response.deck_id
    Given path 'deck', deckId
    When method get
    Then status 200
    And match response == deckSchema
    And match response.success == true
    And match response.deck_id == deckId

  Scenario: [Happy Path] GET /deck/new/draw/ - Draw all cards
    Given path 'deck', 'new'
    And param jokers_enabled = true
    When method get
    Then status 200
    And match response.success == true
    * def deckId = response.deck_id
    Given path 'deck', deckId, 'draw'
    And param count = 54
    When method get
    Then status 200
    And match response.success == true
    And match response == drawSchema
    And match each response.cards == cardSchema

  Scenario: [Happy Path] GET /deck/{{deckId}}/pile/{{pileId}}/add
    Given path 'deck', 'new', 'shuffle'
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def firstCard = result.response.cards[0].code
    Given path 'deck', deckId, 'pile', 'firstPile', 'add'
    And param cards = firstCard
    When method get
    Then status 200
    And match response.success == true
    And match response.piles.firstPile.remaining == 1

  Scenario: [Happy Path] GET /deck/{{deckId}}/pile/{{pileId}}/list
    * def pileId = 'firstPile'
    Given path 'deck', 'new', 'shuffle'
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def firstCard = result.response.cards[0].code
    Then def cardToAdd = firstCard
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 1
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def secondCard = result.response.cards[0].code
    Then def cardToAdd = secondCard
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 2
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def thirdCard = result.response.cards[0].code
    Then def cardToAdd = thirdCard
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 3
    Given path 'deck', deckId, 'pile', pileId, 'list'
    When method get
    Then status 200
    And match response.success == true
    And match response.piles.firstPile.cards[0].code == firstCard
    And match response.piles.firstPile.cards[1].code == secondCard
    And match response.piles.firstPile.cards[2].code == thirdCard

  Scenario: [Happy Path] GET /deck/{{deckId}}/pile/{{pileId}}/draw
    * def pileId = 'firstPile'
    Given path 'deck', 'new', 'shuffle'
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def cardToAdd = result.response.cards[0].code
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 1
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def cardToAdd = result.response.cards[0].code
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 2
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def thirdCard = result.response.cards[0].code
    Then def cardToAdd = thirdCard
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 3
    Given path 'deck', deckId, 'pile', pileId, 'draw'
    And param count = 1
    When method get
    Then status 200
    And match response.success == true
  And match response.cards[0].code == thirdCard

  Scenario: [Happy Path] GET /deck/{{deckId}}/pile/{{pileId}}/draw/bottom
    * def pileId = 'firstPile'
    Given path 'deck', 'new', 'shuffle'
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def firstCard = result.response.cards[0].code
    Then def cardToAdd = firstCard
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 1
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def cardToAdd = result.response.cards[0].code
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 2
    Given def result = call read('classpath:deckofcards/get-a-card.feature')
    Then def cardToAdd = result.response.cards[0].code
    Given def result = call read('classpath:deckofcards/add-a-card-to-a-pile.feature')
    And match result.response.piles.firstPile.remaining == 3
    Given path 'deck', deckId, 'pile', pileId, 'draw', 'bottom'
    And param count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.cards[0].code == firstCard
