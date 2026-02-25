//"use strict";
const app={}
const nd={};

window.onload = function(){
};


window.addEventListener("click", function(event){

	if( Object.keys(event.target.dataset).length > 0  ){
		event.preventDefault();


	} else if( event.target.href ) {

		if( event.target.id == "ex" ){
			
		} else {
			event.preventDefault();
			app.turbo.init(event.target.href);

		};

	} else {
	};

});



window.onpopstate = function(event) {
	if(event.state!=undefined){
		app.turbo.pop(event.state);
	} else {
		app.turbo.pop('/');
	};
};


app.turbo =(function() {
	var init, pop, get, ntitle, jsload;

	init = function(href) {
		window.history.pushState(href, null, href);
		window.history.replaceState(href, null, href);
		get(href);
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};


	pop = function(href) {
		get(href);
	};


	get = async function(href){
		let response = await fetch(href);
		let markup = await response.text();
		
		let page = document.createElement( 'html' );
		page.innerHTML = markup;
		document.querySelector('title').textContent = page.querySelector('title').textContent;
		document.querySelector('bd').innerHTML = page.querySelector('bd').innerHTML;
	};


	return {
		init:init,pop:pop
	};
})();