@module "CoffeeCup", ->
  @camelize = (str) ->
    str = str.toLowerCase()
    str = (part.charAt(0).toUpperCase() + part.slice(1) for part in str.split('/')).join('.')
    str = (part.charAt(0).toUpperCase() + part.slice(1) for part in str.split('_')).join('')

    return str


  @renderView = (path) ->
    instanceName = CoffeeCup.camelize($('body').data('instance')) if $('body').data('instance')

    try eval("new Views.#{path}")
    try eval("new Views.#{instanceName}.#{path}")
