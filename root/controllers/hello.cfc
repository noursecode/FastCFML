component{
	
	function main(name) {
		
		data = new models.hello().main(name);
		
		savecontent variable="body"{
			include "/views/hello.cfm";
		};
		
		savecontent variable="layout"{
			include "/layouts/main.cfm";
		};
		
		return writeoutput(layout);
	}
	
}


