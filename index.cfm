<cfscript>
	
	// sample controllers
	
	switch(route){
		
		// returns the home page with data from a function
		case "GET/":
			data = application.home.main(req); // for speed, model is cached in the application scope
			body = include_view("/home.cfm");
			include_layout("/main.cfm");
			break;


		// returns a hello world page with a URL path variable, for example /hello/Sam
		case "GET/hello":
			request.p2 = get_urlpath(2);
			data = new models.hello().main(request.p2);
			body = include_view("/hello.cfm");
			include_layout("/main.cfm");
			break;
			
		
		// returns JSON data from a function to the client
		case "GET/jsontest":
			data = new models.jsontest().main(req);
			json(data);
			break;

		
		// only use this for development. It sets any application variables
		case "GET/reinit":
			onApplicationStart();
			dump(application);
			break;


		default:
			header statusCode = 404;
			break;
	};


</cfscript>

