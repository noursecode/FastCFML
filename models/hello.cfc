component{
	
	function main(p2){
		
		// if the second URL segment value exists
		if( len(p2) > 0 ){
			name = p2
		} else {
			name = "World"
		};
		
		
		// prepare the result object
		data ={
			'title':'Hello, ' & name
		}
		
		// return it to the controller
		return data;
	}

	
}