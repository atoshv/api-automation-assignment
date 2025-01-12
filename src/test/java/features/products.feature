Feature: Products API tests

  Background:
    * url baseUrl

  Scenario: Get all products
    Given path '/products'
    When method get
    Then status 200
    And match response.products[0].name == 'Product 1'

  Scenario: Create a new product (admin only)
    Given header Authorization = 'Bearer'+" QpwL5tke4Pnpja7X4"
    And request { "name": "New Product", "price": 100, "description": "A test product" }
    When method post
    Then status 201
    And match response.name == 'New Product'

  Scenario: Delete a product by ID (admin only)
    Given header Authorization = 'Bearer'+" QpwL5tke4Pnpja7X4"
    And path '/products/1'
    When method delete
    Then status 204
