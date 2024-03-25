@faketest
Feature:Fake Insecure Test

  Background:
    * url apiUrl

  Scenario: Fake Test to ensure ZAP find some issues
    Given path 'deck', 'new'
    And header User-Agent = 'Mozilla/5.0 (insecure)'
    And header Referer = 'http://insecure-website.com'
    And header X-Powered-By = 'InsecureServer'
    And header Cookie = 'sessionid=123456789'
    When method get
    Then status 200
