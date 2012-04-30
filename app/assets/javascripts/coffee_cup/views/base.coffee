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

    $.get(url, (data) => @receivePartial(data, callback, rootTag))


  locale: () -> $('meta[name="content-language"]').attr('content')


  receivePartial: (data, callback, rootTag) ->
    partial = $('<div>' + data + '</div>').find(rootTag).html()

    callback partial

  render: (path) -> CoffeeCup.renderView CoffeeCup.camelize(path)
