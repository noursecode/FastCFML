<cfscript>
	home = new controllers.home();
	hello = new controllers.hello();
	about = new controllers.about();

	switch(route){

		case "GET/":
		    home.main();
		    break;

		case "GET/hello":
			request.name = get_urlpath(2);
			hello.main(request.name);
			break;

		case "GET/about":
			about.main();
			break;

		default:
		    home.main();
		    break;

	};

</cfscript>
