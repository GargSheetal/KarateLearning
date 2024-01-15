Feature: Put API tests

  # how to create random email
  Background: 
    * def random_string =
      """
      	{
      		function(s) {
      			let text = "";
      			let pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
      			
      			for(let i=0, i<s, i++)
      				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      				return text;
      		}
      	}
      """
    # calling random_string function to create a random string
    * def randomString = random_string(10)
    * def requestPayload =
      """
      {
      	"name": "Misha",
      	"job": "Business"
      }
      """
		* set requestPayload.email = randomString + "@gamil.com"
	
	
  Scenario: Update user
    Given url 'https://reqres.in/api/users/2'
    And request { "name": "Misha", "job": "Business" }
    When method PUT
    Then status 200
    And print response
