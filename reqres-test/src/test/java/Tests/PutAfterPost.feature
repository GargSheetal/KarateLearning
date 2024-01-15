Feature: Post API tests

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  
  Scenario: create a user 5
  	# Post with read request body from file
    Given path '/users'
    And def requestBody = read("request1.json")
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And match $.id == '#present'
    And print response
    
    # Put after fetching the id from post call
    * def userId = response.id
    Given path '/users/' + userId
    And request { "name": "Misha", "job": "Business" }
    When method PUT
    Then status 200
    And print response
    And match $.id == userId
