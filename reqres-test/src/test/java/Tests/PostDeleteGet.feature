Feature: Create a user and get it after deleting

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  Scenario: 
    # 1. Create a user
    Given path '/users'
    And def requestBody = read("request1.json")
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response == expectedOutput
		
		#	2. Fetch the id
		 * def userId = response.id
		 * print userId
		 	
		# 3. Delete the user 	
		Given path '/users/' + userId
		When method DELETE
		Then status 204
		And print response
		
		# 4. Get the deleted user using same userId
		Given path '/users/' + userId
		When method GET
		Then status 404	
		And print response
