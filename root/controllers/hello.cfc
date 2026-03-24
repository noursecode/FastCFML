component{
	
	function show() {
		
		name = get_urlpath(2);
		
		data = new models.hello().main(name);
		
		savecontent variable="body"{
			include "/views/hello.cfm";
		};
		
		savecontent variable="layout"{
			include "/layouts/main.cfm";
		};
		
		return writeoutput(layout);
	}



	function get_urlpath(id){
		if( listlen(cgi.path_info,"/") >= id ){
			return listgetat( cgi.path_info, id, "/" );
		} else {
			return "";
		};
	}
	
}


