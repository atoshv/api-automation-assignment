Feature: Orders API tests

  Background:
    * url baseUrl

  Scenario: Get all orders (admin only)
    Given header Authorization = 'Bearer some_admin_token'
    Given path '/orders'
    When method get
    Then status 200

  Scenario: Create an order
    Given request { "productId": 1, "quantity": 2 }
    When method post
    Then status 201
    And match response.productId == 1

  Scenario: Update an order by ID (admin only)
    Given header Authorization = 'Bearer some_admin_token'
    And path '/orders/1'
    And request { "quantity": 3 }
    When method put
    Then status 200
    And match response.quantity == 3

  Scenario: Delete an order by ID (admin only)
    Given header Authorization = 'Bearer some_admin_token'
    And path '/orders/1'
    When method delete
    Then status 204
