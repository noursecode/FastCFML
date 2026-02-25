# FastCFML

The minimal CFML framework to build apps, sites, and APIs.

Designed with two goals in mind:

- Build stuff faster
- Build stuff that runs faster


## The problem

We already have great frameworks in the CFML world such as FW/1, ColdBox, and Wheels. All of which were written by brilliant people — the giants of the industry.

FastCFML isn't trying to be better or smarter, it is trying to be faster and easier.

For example, when building a microservice, website, or app, it might make sense to keep it lighter. You may not need dependency injection, an ORM, or a third-party module.

But you still need to keep it organized.

FastCFML guardrails your code using an MVC pattern (Model View Controller), while keeping overhead as low as possible.

This makes it faster to write, and faster to run.


## The inspiration

There are a lot of brilliant software engineers in the world, many of whom use CFML, but the one project that caught my eye was FastAPI by Sebastián Ramírez Montaño.

And yes, I would assume Sebastián probably does not write CFML at all, as he is a Python developer.

He compiled the best tools and methods from other solutions into a product designed to build fast APIs. He wasn't trying to reinvent the wheel, he just wanted a tool to build stuff he was working on.

So in a way, I'm trying to do the same thing: create a tool I can use to build CFML apps faster, that run faster.


## Where will this lead?

Maybe nowhere considering most new development is written in Python, Node, Ruby, and other languages. Which, by the way, are all great languages.

CFML, on the other hand, is a batteries included scripting language that runs on top of Java, and is very easy to learn. As a dev, you don't compile or build the code, it compiles into Java bytecode at runtime. All you have to do is write the code, and refresh the browser. Pretty simple.

When I say "batteries included," it includes baked in goodies such as HTTP, encryption, a web server, cookies, and much more. You don't need a package manager such as PIP or NPM.

I look at it this way, if people are interested in this approach, great. If not that is perfectly fine.

If nothing else, I hope it shows there are alternatives to building apps, everything here is free open source.



## Requirements

A CFML runtime such as Lucee, Adobe ColdFusion, or BoxLang.

A URL rewrite that passes all requests to the main index.cfm file.

For example: `RewriteRule ^/(.*)$ /index.cfm/$1 [L];`


## How to run

The simplest way is using CommandBox by Ortus. It gives you an option to set url rewrite to true.


## FastCFML Routing

The index.cfm file becomes the main router, each route includes a request verb and action, for example GET/hello

Routing also includes two utility functions for more complicated routes.

1. get_urlpath(2) finds segments in the URL path. For example finding "12345" in /books/12345

2. get_urlparam('name') finds URL parameters, for example finding "Bob" in /items/id?name=Bob


## FastCFML Controllers

For simple apps, each route in the index.cfm file is also a controller. For larger apps, controllers can be in separate files.

Here is an example:

```
GET/items
data = new models.items().main(req);
body = include_view("/items.cfm");
include_layout("/main.cfm");
```

- Line 1: Isolates the controller based on verb and action (or resource if you prefer)
- Line 2: Calls the model function (a CFC file)
- Line 3: Inludes a view template that accepts data from the model as an object (structure)
- Line 4: Includes a layout template that returns the page to the client (browser)

The REQ variable accepted by the model is a request object that contains headers, form variables, etc.


## FastCFML Models

Each model is a CFC component called from the controller. For example: data = new models.home().main()

In this case "home.cfc" is the component, and "main" is the method being called.

Think of a component as a class of methods, but does not have to be object-oriented. It can simply be a group of related functions.

The model's job is to create a structure, and return it to the view.

However if building an API, the structure is returned directly to the client as either JSON, JSON-RPC, or XML


## FastCFML Views

Views are HTML that can be included in each controller. For example: body = include_view("/home.cfm")

The view accepts structure data from the model using a data scope, for example data.title, data.users, data.address etc.

To make it work, all content in a view must be inside <CFOUTPUT> tags.

Finally, the view is returned as a variable named body.


## FastCFML Layouts

Layouts are also HTML, and can be included in each controller. For example: include_layout("/main.cfm");

The layout accepts the body variable from the view as well as meta data.

All content in a layout must be inside <CFOUTPUT> tags.

Finally, the layout is returned to the client.


## JSON output

FastCFML includes a utility function that converts a JSON object to a string, then outputs to the browser:

json(data)


## Reactive

JavaScript (similar to HTMX) prevents default click events. This loads each page into the dom without a refresh.

JavaScript can be also used for form posts, searching, and more, but the framework only provides the bare necessities.


