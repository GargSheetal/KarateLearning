Feature: Config Demo

  Background: 
    * url baseUrl
    * header Accept = "application/json"

  Scenario: Config demo 1
    Given print name

  # get request with params
  Scenario: Get all users
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
