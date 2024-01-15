Feature: Post API tests

  Background: 
    * url 'https://reqres.in/api'
    #* def requestPayload = read('classpath:src/test/resources/TestData/request1.json')
   

  # Post with read request body from file in a separate folder
  Scenario: create a user 1
    Given path '/users'
    And request read('classpath:src/test/resources/TestData/request1.json')
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response

 