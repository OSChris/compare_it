# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $ ->
    $("#price").change ->
      newValue = $("#price").val()
      $(".price-display").text(newValue)
    $("#portion").change ->
      newValue = $("#portion").val()
      $(".portion-display").text(newValue)
    $("#taste").change ->
      newValue = $("#taste").val()
      $(".taste-display").text(newValue)

$(document).ready(ready)
$(document).on('page:load', ready)