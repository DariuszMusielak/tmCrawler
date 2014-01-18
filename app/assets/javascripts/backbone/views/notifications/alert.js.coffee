class TmCrawler.Views.Alert extends Backbone.View
  el: 'body'

  events:
    'click .alert-dismissable' : 'ByClick'
    'ajax:error' : 'showNotice'

  initialize: ->
    @removed = false
    @initTime()

  initTime: ->
    setTimeout (=>
      @AfterTime() unless @removed
    ), 3500

  ByClick: (event) ->
    event.preventDefault()
    @hide($(event.target).closest(".alert"))

  AfterTime: ->
    @hide($('.alert-dismissable').closest(".alert"))

  hide: (target) ->
    target.addClass("animated bounceOutUp")
    target.one('webkitAnimationEnd mozAnimationEnd oAnimationEnd animationEnd', ->
      target.remove()
      @removed = true
    )
