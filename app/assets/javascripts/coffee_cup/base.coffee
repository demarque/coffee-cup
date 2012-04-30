@module = (names, fn) ->
  names = names.split '.' if typeof names is 'string'
  space = @[names.shift()] ||= {}
  space.module ||= @module
  if names.length
    space.module names, fn
  else
    fn.call space


@view = (names, obj) ->
  names = names.split '.'
  className = names[names.length - 1]
  namespace = names[0..names.length-2]

  @module "Views.#{namespace.join('.')}", ->
    @[className] = class extends ActionView
      if obj.constructor then constructor: obj.constructor
      @::[key] = value for key, value of obj when key isnt 'constructor'
