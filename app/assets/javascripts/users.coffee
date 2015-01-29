# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

upload_song = ->
  $(document).on 'click', '#upload-song', ->
    $('#song-column').animate({
      width: "25%"
      }, 150, "linear",
      ()->
        return)
  $(document).on 'click', '#hide', ->
    $('#song-column').fadeOut(150, ()->
      $('#song-column').css('display', 'block').css('width', '0'))

$('body').bind('page:change', upload_song)
$ ->
  do upload_song
