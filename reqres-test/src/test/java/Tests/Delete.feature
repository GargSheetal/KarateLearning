Feature: Delete API tests

Scenario: Delete user
Given url "https://reqres.in/api/users/2"
When method DELETE
Then status 204
And print response