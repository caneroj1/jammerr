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
  if $('.search-background').length > 0
    $('.user-navigation-item, .brand').addClass('user-navigation-item-white').removeClass('user-navigation-item');
    $('.search-background').fadeIn(300);


$('body').bind('page:change', upload_song)
$ ->
  if $('.notice').length > 0
    $('.notice').animate({
      opacity: 0
      }, 3000)

  if $('.alert').length > 0
    $('.alert').animate({
      opacity: 0
      }, 3000)

  do upload_song
  do change_bg_for_search
