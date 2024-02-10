@issue
Feature:Issues

  Background:
    * url apiUrl

  @issue113
  # https://github.com/crobertsbmw/deckofcards/issues/113
  Scenario: Issue 113 - Last card not drawn when drawing multiple specific cards from Pile
    # Created new deck: https://deckofcardsapi.com/api/deck/new?jokers_enabled=true
    Given path 'deck', 'new'
    And param jokers_enabled = true
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    And match response.remaining == 54
    #Drew top 13 cards (Spades): https://deckofcardsapi.com/api/deck/{{new_deck_j_id}}/draw/?count=13
    Given path 'deck', deckId, 'draw'
    And param count = 13
    When method get
    Then status 200
    And match response.success == true
    And match response.remaining == 41
    #Created a pile from drawn cards (AS,2S) named 'spades_pile': https://deckofcardsapi.com/api/deck/{{new_deck_j_id}}/pile/spades_pile/add/?cards=AS,2S
    Given path 'deck', deckId, 'pile', 'spades_pile', 'add'
    And param cards = 'AS,2S'
    When method get
    Then status 200
    And match response.success == true
    And match response.remaining == 41
    And match response.piles.spades_pile.remaining == 2
    #Added rest of drawn cards to pile: https://deckofcardsapi.com/api/deck/{{new_deck_j_id}}/pile/spades_pile/add/?cards=3S,4S,5S,6S,7S,8S,9S,0S,JS,QS,KS
    Given path 'deck', deckId, 'pile', 'spades_pile', 'add'
    And param cards = '3S,4S,5S,6S,7S,8S,9S,0S,JS,QS,KS'
    When method get
    Then status 200
    And match response.success == true
    And match response.remaining == 41
    And match response.piles.spades_pile.remaining == 13
    #Listed cards in pile: https://deckofcardsapi.com/api/deck/{{new_deck_j_id}}/pile/spades_pile/list/
    Given path 'deck', deckId, 'pile', 'spades_pile', 'list'
    And param cards = '3S,4S,5S,6S,7S,8S,9S,0S,JS,QS,KS'
    When method get
    Then status 200
    And match response.success == true
    And match response.remaining == 41
    And match response.piles.spades_pile.remaining == 13
    And match response.piles.spades_pile.cards[0].code == 'AS'
    And match response.piles.spades_pile.cards[1].code == '2S'
    And match response.piles.spades_pile.cards[2].code == '3S'
    And match response.piles.spades_pile.cards[3].code == '4S'
    And match response.piles.spades_pile.cards[4].code == '5S'
    And match response.piles.spades_pile.cards[5].code == '6S'
    And match response.piles.spades_pile.cards[6].code == '7S'
    And match response.piles.spades_pile.cards[7].code == '8S'
    And match response.piles.spades_pile.cards[8].code == '9S'
    And match response.piles.spades_pile.cards[9].code == '0S'
    And match response.piles.spades_pile.cards[10].code == 'JS'
    And match response.piles.spades_pile.cards[11].code == 'QS'
    And match response.piles.spades_pile.cards[12].code == 'KS'
    #OK so far but when drawing 4 specific cards from pile:
    # http://deckofcardsapi.com/api/deck/{{new_deck_j_id}}/pile/spades_pile/draw/?cards=5S,6S,7S,8S
    Given path 'deck', deckId, 'pile', 'spades_pile', 'draw'
    And param cards = '5S,6S,7S,8S'
    When method get
    Then status 200
    And match response.success == true
    #Expected result is that all 4 drawn cards are listed and remaining number of cards in pile is 9
    #Actual result is that last value passed(8S) is not listed and remaining number of cards in pile is 10
    And match response.piles.spades_pile.remaining == 9

  @issue119
  # https://github.com/crobertsbmw/deckofcards/issues/119
  Scenario: Issue 119 - Sometimes card shuffle doesnt work
    # I'm fetching deck with fetch('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1');
    * def firstFiveCards = 'AS2S3S4S5S'
    Given path 'deck', 'new', 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And def deckId = response.deck_id
    # Drawing some cards with fetch('https://deckofcardsapi.com/api/deck/${deck?.deck_id}/draw/?count=${count}')
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # After game shuffling them with fetch('https://deckofcardsapi.com/api/deck/${deck?.deck_id}/shuffle/?deck_count=1');
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    # And sometimes it gives me back deck when cards are in order from ace of spades, 2 of spades, 3 of spades ... etc.
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #2
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #3
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #4
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #5
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #6
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #7
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #8
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #9
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
    # Attempt #10
    Given path 'deck', deckId, 'shuffle'
    And param deck_count = 1
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    Given path 'deck', deckId, 'draw'
    And param count = 5
    When method get
    Then status 200
    And match response.success == true
    And match response.deck_id == deckId
    And match firstFiveCards != response.cards[0].code + response.cards[1].code + response.cards[2].code + response.cards[3].code + response.cards[4].code
