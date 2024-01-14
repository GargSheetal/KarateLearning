Feature: GET api request with headers

  Background: 
    * url 'https://reqres.in/api'

  Scenario: Get all users with headers part 1
    Given header Content-Type = 'application/json; charset=utf-8'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection = 'keep-alive'
    And header Accept = '*/*'
    When path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  Scenario: Get all users with headers part 2
    * def request_headers = {Content-Type: 'application/json; charset=utf-8', Accept-Encoding: 'gzip, deflate, br', Connection: 'keep-alive', Accept: '*/*'}
    Given headers request_headers
    When path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    
  Scenario: Get all users with headers part 3
    * configure headers = {Content-Type: 'application/json; charset=utf-8', Accept-Encoding: 'gzip, deflate, br', Connection: 'keep-alive', Accept: '*/*'}
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
