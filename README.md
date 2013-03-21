Coffee Cup
===============

Coffee Cup set the foundations of a Rails like structure for your all your CoffeeScript code.

Problem
-------

There's currently no convention to structure the CoffeeScript code. The directory /assets/javascripts
can quickly become a mess and after a while it become really hard to identify which file are used in
which context.

This is where Coffee Cup is coming to the rescue !

It provide a standardize CoffeeScript structure mirror on the rails directories. For each view, you'll
exactly know what CoffeeScript dependency it has.

Install
-------

```
gem install coffee-cup
```

Rails 3
-------

In your Gemfile:

```ruby
gem 'coffee-cup'
```

In your javascript manifest

```javascript
// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require coffee_cup
```

Coffee Cup rely on a data attribute inside the body tag to indicate the current controller and action.
It is required to add to your body tag the following code :

```ruby
content_tag(:body, "data-coffee-cup" => CoffeeCup.body_data(request)) do
  # Layout
end
```

Usage
-----

Coffee Cup is mainly a directory convention to store your CoffeeScript.

### Basic File Structure

You must first create the following directories :


```
  # In app/assets/javascripts/
  app
   |-- helpers
         |-- application_helpers.coffee
   |-- views
```

### Helpers
```coffeescript
# app/assets/javascripts/app/helpers/application_helpers.coffee
@module "ApplicationHelper", ->
  @initialize = ->
```

The code in the initialize will be loaded first. You can place all the global helpers of your application
in this directory and initialize them from the ApplicationHelper#initialize method.

### Views

Inside the views directory, you will place the code for each view. For example, if you have specific code
for the users_controller#show, you will create the following file.

```coffeescript
# app/assets/javascripts/app/views/users/show.coffee
@view "Users.Show",
  constructor: -> # Insert your code for the Users Show action.
```

This code will only be executed when the Users Show action is called.

### Partials

Sometimes the same block of codes need to be shared between differents actions. To solve this situation,
you have access to a ```render``` method.

For example, if you need the same code inside the Users New and Edit, let's say for a form. You could do
the following :

```coffeescript
# app/assets/javascripts/app/views/users/new.coffee
@view "Users.New",
  constructor: -> @render 'users/form'
```

```coffeescript
# app/assets/javascripts/app/views/users/edit.coffee
@view "Users.Edit",
  constructor: -> @render 'users/form'
```

```coffeescript
# app/assets/javascripts/app/views/users/_form.coffee
@view "Users.Form",
  constructor: -> # This code will be shared between the New and Edit actions.
```

### Loading a partial

You can use the method ```loadPartial``` to make an AJAX call to the server requesting html content.

```coffeescript
# app/assets/javascripts/app/views/users/index.coffee
@view "Users.Index",
  loadUserProfile: -> @loadPartial 'http://app.dev/users/show', 'myCallbackMethod', '#id-of-the-root-element'

  myCallbackMethod: (data) -> $('body').append(data)
```

This method will call the url by adding the parameter ```layout=none```. After receiving the response, it will call
the callback method in the current context.

The last parameter is optional and will be used to restrict the received html content with a jQuery ```find```.


Copyright
---------

Copyright (c) 2013 De Marque inc. See LICENSE for further details.
