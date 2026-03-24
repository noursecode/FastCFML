# FastCFML

The minimal framework for building things using CFML (ColdFusion Markup Language).

Build modern MVC applications without the overhead of larger framework libraries or vendor lock-in.

Uses a simple JavaScript pushState function to load pages without refresh.


## What can you build?

- Websites
- APIs
- Blogs
- Microservices


## How to run

Clone project to your desktop

```
cd desktop

git clone https://github.com/noursecode/FastCFML.git

cd fastcfml
```


With CommandBox installed, start server
```
box server start
```


View app in browser
```
http://localhost:3000
```


## Structure

```
FastCFML
    │
    ├── Application.cfc      # the framework
    │
    ├── index.cfm            # the router
    │
    ├── controllers          # one function per controller
    │   ├── controller1.cfc		
    │   └── controller2.cfc
    │
    ├── models               # data from databases, business logic, API connections
    │   ├── model1.cfc		
    │   └── model2.cfc
    │
    ├── views                # html snippets
    │   ├── view1.cfm
    │   └── view2.cfm
    │
    └── layouts              # html header/footer with css and client javascript
        ├── layout1.cfm
        └── layout2.cfm
        
```


## Example router (index.cfm)

```
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
```


## Example controller (controllers/home.cfc)

```
component{
	
	function main() {
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
```


## Example model (models/home.cfc)


```
component{
	function main() {
		return "Hello World!"
	}
}
```


## Example view (views/home.cfm)

```
<cfoutput>
	<h1>#data.title#</h1>
	<p>This is the HOME page</p>
</cfoutput>
```


## Example layout (layouts/main.cfm)
```
<cfoutput><!doctype html>
<html class="no-js" lang="">
<head>
<title>#metatitle#</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8"/>
<link rel="stylesheet" media="screen" href="/assets/css/main.css">
</head>
<body>
<bd>
<nav>
    <a href="/">HOME</a>
    <a href="/hello">HELLO</a>
    <a href="/about">ABOUT</a>
</nav>
<div class="container">
#body#
</div>
<footer>&copy; #year(now())# FastCFML</footer>
</bd>
<script src="/assets/js/main.js"></script>
</body>
</html></cfoutput>
```
