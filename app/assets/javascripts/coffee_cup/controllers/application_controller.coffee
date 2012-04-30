#*************************************************************************************
# Application Controller
#*************************************************************************************
class ApplicationController
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  loadHelpers: -> ApplicationHelper.initialize()

  loadView: ->
    if $('body').data('coffee-cup')
      CoffeeCup.renderView $('body').data('coffee-cup').split('#').join('.')
    else
      alert 'Coffee Cup : Installation incomplete. Please insert the body attribute "data-coffee-cup". See documentation for more details.'


#*************************************************************************************
# When the document is ready, it will load the appropriate objects
#*************************************************************************************
$ ->
  controller = new ApplicationController
  controller.loadHelpers()
  controller.loadView()
