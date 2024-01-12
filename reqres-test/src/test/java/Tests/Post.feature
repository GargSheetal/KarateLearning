Feature: Post API tests

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # Simple post request
  Scenario: create user test 1
    Given url 'https://reqres.in/api/users'
    And request { "name": "Shama", "job": "Architect" }
    When method POST
    Then status 201
    And print response

  # Post with path
  Scenario: create a user 2
    Given path '/users'
    And request { "name": "Rohit", "job": "Teacher" }
    When method POST
    Then status 201
    And print response

  # Post with assertions
  Scenario: create a user 3
    Given path '/users'
    And request { "name": "Rohit", "job": "Teacher" }
    When method POST
    Then status 201
    And match response == {"name": "Rohit", "job": "Teacher", "id": "#string", "createdAt": "#ignore"}
    And print response

  # Post with read response from file
  Scenario: create a user 4
    Given path '/users'
    And request { "name": "Rohit", "job": "Teacher" }
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response

  # Post with read request body from file
  Scenario: create a user 5
    Given path '/users'
    And def requestBody = read("request1.json")
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response
    
  # Post with read request body from file in a separate folder
  Scenario: create a user 6
    Given path '/users'
    And def filePath = karate.properties["user.dir"] + "/src/test/resources/TestData/request1.json"
    And print filePath
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response
  
  # Post with read request body from file and change value
  Scenario: create a user 7
    Given path '/users'
    And def requestBody = read("request1.json")
    And set requestBody.job = "Business"
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response
  
  
  
  
  
