function () {
	let config = {
		name: "Rohit",
		baseUrl : "https://reqres.in/api"
	}
	
	let env = karate.env;
	karate.log("The value of env is: " + env);
	
	if(env == "qa") {
		config.baseUrl = "https://reqres.in/api/qa"
	}
	else if(env == "dev") {
		config.baseUrl = "https://reqres.in/api/dev"
	}
	else {
		config.baseUrl = "https://reqres.in/api"
	}
		
	
	karate.configure("connectTimeout", 5000);
	karate.configure("readTimeout", 6000);
	
	return config;
}