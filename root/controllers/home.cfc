component{
	
	function show() {
		data = new models.home().main();
		
		savecontent variable="body"{
			include "/views/home.cfm";
		}
		
		savecontent variable="layout"{
			include "/layouts/main.cfm";
		}
		
		return writeoutput(layout);
	}
	
}