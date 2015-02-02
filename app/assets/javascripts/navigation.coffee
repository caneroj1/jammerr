navigation_ajax = ->
  $('#user-navigation-search').click () ->
    $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=search.js")
  $('#user-navigation-profile').click () ->
    $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=show.js")
  $('#user-navigation-settings').click () ->
    $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=settings.js")

$(window).bind('page:change', navigation_ajax)
$ ->
  do navigation_ajax
