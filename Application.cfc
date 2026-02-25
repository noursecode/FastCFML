component{
	// name your application
	this.name = "FastCFML";
	
	// generic CFML settings
	this.applicationTimeout = createTimeSpan(0,0,30,0);
	this.sessionmanagement = true;
	this.setclientcookies = true;
	
	
	// map directories to make paths easier
	this.mappings["/layouts"]="./layouts";
	this.mappings["/models"]="./models";
	this.mappings["/views"]="./views";
	
	
	// onApplicationStart
	// use this to cache application variables
	public boolean function onApplicationStart(){
		application.home = new models.home();
		application.about = new models.about();
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
		if( cgi.path_info == '/index.cfm' ){
			action = "/";
		} else {
			action = "/" & listfirst( cgi.path_info, "/" );
		};
		
		
		// combine the method and action as the route
		route = ucase(req.method) & action;
		
		
		// capture the URL root as a variable
		if( cgi.https=="off" ){
			root ="http://" & cgi.http_host;
		} else {
			root ="https://" & cgi.http_host;
		};

		return true;
	}


	// onRequest
	// This returns stuff to the client, you need this
	function onRequest(string targetPage){
		include arguments.targetPage;
	}








	// Global Functions



	// converts a JSON structure into a string, then returns it to the client
	function json(doc){
		content type="application/json";
		res = serializejson(doc);
		return echo(res);
	}
	
	
	// returns an HTML content type to the client
	function html(doc){
		content type="text/html";
		return echo(doc);
	}


	// includes a controller outside the main index.cfm file
	// make sure you create a controllers directory
	function include_controller(path){
		include template = "/controllers" & path & ".cfm"
	}


	// includes a view file, then saves it as a body variable
	// store all views in the views directory
	function include_view(path){
		savecontent variable='body'{
			include template= "/views" & path;
		};
		return body;
	}


	// includes a layout file, then rerturns it to the client
	// store all layouts in the layouts directory
	function include_layout(path){
		include template = "/layouts" & path
	}


	// returns a model if using a CFM file
	// As is, you need to include the full path to the CFM file
	function include_model(path){
		include template= path
	}


	// gets a segment of a URL based on the position.
	// For example to find "id" from /action/id/items, use get_urlpath(2)
	function get_urlpath(id){
		if( listlen(cgi.path_info,"/") >= id ){
			return listgetat( cgi.path_info, id, "/" );
		} else {
			return "";
		};
	}

	
	// gets a URL paramter based on a name.
	// For example to find "bob" from /action?name=bob, use get_urlparam('name')
	function get_urlparam(id){
		if( structkeyexists(url,id) ){
			return structfind(url,id)
		} else {
			return "";
		}
	}
	

}

