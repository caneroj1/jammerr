# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

upload_song = ->
  $(document).on 'click', '#upload-song', ->
    $('#hide').css('display', 'block')
    $('#song-column').animate({
      width: "25%"
      }, 150, "linear",
      ()->
        return)

  $(document).on 'click', '#hide', ->
    $('#song-column').fadeOut(150, ()->
      $('#hide').css('display', 'none')
      $('#song-column').css('display', 'block').css('width', '0'))

change_bg_for_search = ->
  $('#user-navigation-search').on 'click', ->
    $('.left-navigation').animate({
      backgroundColor : 'rgba(255, 255, 255, 0)'
      }, 100, "linear", ()->
        return)
    $('.search-background').fadeIn(300);

enable_tooltips = ->
  $('[data-toggle="tooltip"]').tooltip()

change_bg_for_others = ->
  $('#user-navigation-home, #user-navigation-profile, #user-navigation-settings').on 'click', ->
    if $('.search-background').css('display')
      $('.search-background').fadeOut(300)
      $('.left-navigation').animate({
        backgroundColor : '#333'
        }, 100, "linear", ()->
          return)

fade_in_search_bg = ->
  if $('.search-header').css('width') != '0px'
    $('.left-navigation').css('background-color', 'rgba(255, 255, 255, 0)')
    $('.search-background').fadeIn(300);

fade_outs = ->
  if $('.notice').length > 0
    $('.notice').animate({
      opacity: 0
      }, 3000)

  if $('.alert').text().length > 1
    $('.alert').animate({
      opacity: 0
      }, 3000)

$(window).bind('page:change', change_bg_for_search)
$(window).bind('page:change', change_bg_for_others)
$(window).bind('page:change', fade_outs)

$ ->
  do fade_outs
  do upload_song
  do change_bg_for_search
  do enable_tooltips
  do change_bg_for_others
  do fade_in_search_bg
