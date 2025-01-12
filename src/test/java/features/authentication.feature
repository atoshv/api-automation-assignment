Feature: Authentication API tests

  Background:
    * url baseUrl

  Scenario: Register a new user
    Given request { "email": "eve.holt@reqres.in", "password": "pistol" }
    When method post
    Then status 201
    And match response.email == 'eve.holt@reqres.in'

  Scenario: Login with valid credentials
    Given request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method post
    Then status 201
    And match response.token != null

  ## It is failing because password validation isn't implemented / working.
  Scenario: Login with invalid credentials
    Given request { "email": "invalid@reqres.in", "password": "wrongpassword" }
    When method post
    Then status 400
    And match response.error == 'invalid credentials'

  Scenario: Logout the user
    Given header Authorization = 'Bearer some_valid_token'
    When method get
    Then status 200