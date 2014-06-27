# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $ -> 
    $('#gallery-show').imagesLoaded ->
      $('#gallery-show').masonry
        itemSelector: '.well'
        isFitWidth: true

$(document).ready(ready)
$(document).on('page:load', ready)