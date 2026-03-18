component{
	// name your application
	this.name = "FastCFML";

	// generic CFML settings
	this.applicationTimeout = createTimeSpan(0,0,30,0);
	this.sessionmanagement = true;
	this.setclientcookies = true;


	// map directories to make paths easier
	this.mappings["/layouts"]="layouts";
	this.mappings["/models"]="models";
	this.mappings["/views"]="views";


	// onApplicationStart
	// use this to cache application variables
	public boolean function onApplicationStart(){
		application.home = new models.home();
		application.hello = new models.hello();
		return true;
	}


	// onRequestStart
	// use this for global variables and for authentication
	public boolean function onRequestStart(){
		param name="action" default="";
		param name="root" default="";


		// returns the request structure
		req = getHTTPRequestData();


		// find the action (aka resource) from the URL
		if( cgi.path_info == "/" ){
			action = "/";
		} else {
			action = "/" & listfirst( cgi.path_info, "/" );
		};


		// combine the method and action as the route
		route = ucase(req.method) & action;


		// capture the URL root as a variable
		//if( cgi.https=="off" ){
		//	root ="http://" & cgi.http_host;
		//} else {
		//	root ="https://" & cgi.http_host;
		//};

		return true;
	}


	// onRequest
	// This returns stuff to the client, you need this
	function onRequest(string targetPage){
		include arguments.targetPage;
	}
	




	function get_urlpath(id){
		if( listlen(cgi.path_info,"/") >= id ){
			return listgetat( cgi.path_info, id, "/" );
		} else {
			return "";
		};
	}
	


}