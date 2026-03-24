component{
	
	function show() {
		
		data = new models.about().main();
		
		savecontent variable="body"{
			include "/views/about.cfm";
		};
		
		savecontent variable="layout"{
			include "/layouts/main.cfm";
		};
		
		return writeoutput(layout);
	}
	
}