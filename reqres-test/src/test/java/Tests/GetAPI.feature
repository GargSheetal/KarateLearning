Feature: Get API tests

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = "application/json"

  # simple get request
  Scenario: Get single user
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  # get request with background
  Scenario: Get all users
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  # get request with params
  Scenario: Get all users
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  # get request with query params
  Scenario: Get all users
    * def query = {page : 2}
    Given path '/users'
    And params query
    When method GET
    Then status 200
    And print response

  #	response can be replaced with $ symbol
  # get request with assertions
  Scenario: Get all users
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
