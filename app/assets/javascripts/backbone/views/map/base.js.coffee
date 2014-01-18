class TmCrawler.Views.MapBase extends Backbone.View
  el: '.maps-table'

  events:
    'ajax:success .map-row-destroy' : 'hideAndRemoveMap'

  hideAndRemoveMap: (e, data, status, xhr) ->
    target = $(e.currentTarget).closest('tr')
    target.addClass("animated bounceOutRight")
    target.one('webkitAnimationEnd mozAnimationEnd oAnimationEnd animationEnd', ->
      target.remove()
    )
