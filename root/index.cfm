<cfscript>
	home = new controllers.home();
	hello = new controllers.hello();
	about = new controllers.about();

	switch(route){

		case "GET/": home.show(); break;

		case "GET/hello": hello.show(); break;

		case "GET/about": about.show(); break;

		default: home.show(); break;

	};

</cfscript>
