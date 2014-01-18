#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.TmCrawler =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  currentView: null

  init: ->
    if @currentView?
      @currentView.undelegateEvents()
      @currentView.remove()
      @currentView = null

    $body = $('body')
    viewName = $body.data('view-controller') + $body.data('view-action')
    @currentView = new TmCrawler.Views[viewName]() if TmCrawler.Views[viewName]?
    @alertView ||=  new TmCrawler.Views.Alert()

$(document).on 'ready page:load',  ->
  TmCrawler.init()
