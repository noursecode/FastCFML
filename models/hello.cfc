component{
	
	function main(p2){
		
		if( len(p2) > 0 ){
			name = p2
		} else {
			name = "World"
		};
		
		data ={
			'title':'Hello, ' & name
		}
		return data;
	}

	
}