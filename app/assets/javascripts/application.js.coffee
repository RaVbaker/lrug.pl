#= require jquery
#= require jquery_ujs
#= require_tree .

setMapArea = ->
  $('#map').css
    height: $(window).height()
    width: $(window).width()

$ ->
  setMapArea()
  $(window).on
    resize: -> setMapArea()

