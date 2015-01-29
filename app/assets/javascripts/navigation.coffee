navigation_ajax = ->
  $('#user-navigation-search').click () ->
    $('.user-body-content').load("/users/1/async?page=search")
  $('#user-navigation-profile').click () ->
    $('.user-body-content').load("/users/1/async?page=show")
  $('#user-navigation-settings').click () ->
    $('.user-body-content').load("/users/1/async?page=settings")

$(window).bind('page:change', navigation_ajax)
$ ->
  do navigation_ajax
