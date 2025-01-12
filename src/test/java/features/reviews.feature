Feature: Reviews API tests

  Background:
    * url baseUrl

  Scenario: Get all reviews
    Given path '/reviews'
    When method get
    Then status 200

  Scenario: Create a review
    Given request { "productId": 1, "rating": 5, "comment": "Great product!" }
    When method post
    Then status 201
    And match response.comment == 'Great product!'

  Scenario: Update a review by ID
    Given path '/reviews/1'
    And request { "rating": 4, "comment": "Good product" }
    When method put
    Then status 200
    And match response.comment == 'Good product'

  Scenario: Delete a review by ID
    Given path '/reviews/1'
    When method delete
    Then status 204
