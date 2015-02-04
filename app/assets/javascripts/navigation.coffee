navigation_ajax = ->
  # clicking on search
  $('#user-navigation-search').click () ->
    $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=search.js", ->
      $('.search-background').fadeIn(300, ->
        $('.user-navigation-item, .brand').addClass('user-navigation-item-white').removeClass('user-navigation-item')))

  # clicking on profile
  $('#user-navigation-profile').click () ->
    if $('.search-background').length > 0
      $('#search-body').fadeOut(300)
      $('.search-background').fadeOut(300, ->
        $('.user-navigation-item-white, .brand').removeClass('user-navigation-item-white').addClass('user-navigation-item')
        $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=show.js"))
    else
      $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=show.js")

  # clicking on settings
  $('#user-navigation-settings').click () ->
    if $('.search-background').length > 0
      $('#search-body').fadeOut(300)
      $('.search-background').fadeOut(300, ->
        $('.user-navigation-item-white, .brand').removeClass('user-navigation-item-white').addClass('user-navigation-item')
        $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=settings.js"))
    else
      $('.user-body-content').load("/users/" + jQuery.cookie("uid") + "/async?page=settings.js")

$(window).bind('page:change', navigation_ajax)
$ ->
  do navigation_ajax
