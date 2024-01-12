Feature: Put API tests

  Scenario: Update user
    Given url 'https://reqres.in/api/users/2'
    And request { "name": "Misha", "job": "Business" }
    When method PUT
    Then status 200
    And print response
    
    
