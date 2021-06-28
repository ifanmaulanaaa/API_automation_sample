function karate_config() {
	var config = {
		baseUrl : 'https://dummyapi.io/data/api',
	}
	var env = karate.env
	karate.log("Environment variable value is --- ",env)
	//--Runner for cucumber by default only using in local--//
	if(!env){
	   env = 'env_staging';
	}
	if (env==='env_staging') {
		config.baseUrl = 'https://jsonplaceholder.typicode.com';
	}

    karate.configure('connectTimeout', 50000);
    karate.configure('readTimeout', 50000);
	return config;
}