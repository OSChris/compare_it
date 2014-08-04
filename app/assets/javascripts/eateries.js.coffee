# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#gallery-show').imagesLoaded ->
    $('#gallery-show').masonry
      itemSelector: '.well'
      isFitWidth: true
  cw = $('.child').width() / 2
  $(".child").css height: cw + "px"

  fightScore = ->
    kentscore   = $('.kentstotal').html().replace("Average: ", "")
    eateryscore = $('.eaterytotal').html().replace("Average: ", "")
    if kentscore > parseFloat(eateryscore)
      $('.kent-well').addClass("winner")
      $('.eatery-well').removeClass("animated bounceInLeft").addClass("loser")
    else if eateryscore > parseFloat(kentscore)
      $('.kent-well').removeClass("animated bounceInRight").addClass("loser")
      $('.eatery-well').addClass("winner")

  delay = (ms, func) -> setTimeout func, ms

  hideFlashMessages = ->
    $(".alert").slideUp()

  removeFlashMessages = ->
    $(".alert").remove()

  someFunction = (inputs) ->
    $(".something").slideUp()

  delay 1500, fightScore

  delay 7000, hideFlashMessages

  delay 8000, removeFlashMessages




