@module "ApplicationHelper", ->

class @ActionView
  #*************************************************************************************
  # ALIASES
  #*************************************************************************************
  h: ApplicationHelper


  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  loadPartial: (url, callback, rootTag = '') ->
    if url.indexOf('?') > 0 then url += '&layout=none' else url += '?layout=none'

    $.get(url, (data) => @receivePartial(data, this, callback, rootTag))


  locale: () -> $('meta[name="content-language"]').attr('content')


  receivePartial: (data, caller, callback, rootTag) ->
    if rootTag isnt ''
      partial = $('<div>' + data + '</div>').find(rootTag).html()
    else
      partial = data

    caller[callback](partial)


  render: (path) -> CoffeeCup.renderView CoffeeCup.camelize(path)
