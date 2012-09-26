# omg, coffeescript, so tasty

addCommasToInteger = (x) ->
  x += ''
  rgx = /(\d+)(\d{3})/
  while rgx.test(x)
    x = x.replace(rgx, '$1' + ',' + '$2')
  x

$(document).ready ->
  # If this is homepage, get view count for all posts
  if $('body').hasClass('home')
    $.ajax
      type: 'GET'
      url: '/views/total'
      dataType: 'json'
      success: (data) ->
        views = addCommasToInteger(data.views)
        $('.views').text("#{views}")
      error: (data) ->
        $('.views').text('Lots of')

  # If this is a post, get post view count
  if $('body').hasClass('post')
    slug = $('.views').data('slug')
    $.ajax
      type: 'POST'
      url: '/views'
      data:
        slug: slug
      dataType: 'json'
      success: (data) ->
        views = addCommasToInteger(data.views)
        $('.views').text("#{views} views")
      error: (data) ->
        $('.views').text('Lots of views')


$(window).load ->

  # Fade prev/next post links on scroll
  if $('body').hasClass('post')
    maxOpacity = 0.8
    minOpacity = 0.15
    $banner = $('[role="banner"]')
    bannerBottom = $banner.offset().top + $banner.height()
    $navLinks = $('.prev, .next')
    $meta = $('.meta')
    $copy = $('.copy')
    copyOffset = 100 # start fading in a little early
    copyTop = $meta.offset().top - copyOffset # using meta, since that includes h3
    copyBottom = $copy.offset().top + $copy.height() - copyOffset
    copyHeight = copyBottom - copyTop

    # scroll handler
    onScroll = (event) ->
      $window = $(window)
      windowHeight = $window.height()
      windowTop = $window.scrollTop()
      windowBottom = windowTop + windowHeight

      if windowTop < 0
        opacity = maxOpacity
      else if windowTop <= bannerBottom
        opacity = maxOpacity - ((windowTop / bannerBottom) * (maxOpacity - minOpacity))
      else if windowBottom < copyTop 
        opacity = minOpacity
      else if windowBottom < copyBottom 
        opacity = minOpacity + ((windowBottom - copyTop) / copyHeight * (maxOpacity - minOpacity))
      else
        opacity = maxOpacity

      $navLinks.css(opacity: opacity)

    # throttle scroll events to reasonable rate
    $(window).scroll($.throttle(150, onScroll))
    onScroll();



