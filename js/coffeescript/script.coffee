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

    #constants
    maxOpacity = 0.8
    minOpacity = 0.3
    
    $banner = $('[role="banner"]')
    bannerBottom = $banner.offset().top + $banner.height()

    $meta = $('.meta')
    $copy = $('.copy')
    copyOffset = 100 # start fading in a little early
    copyTop = $meta.offset().top - copyOffset # using meta, since that includes h3
    copyBottom = $copy.offset().top + $copy.height() - copyOffset
    copyHeight = copyBottom - copyTop

    $window = $(window)
    $navLinks = $('.prev, .next')
    $nextLink = $('.next')
    $ad = $('.carbonad')

    # scroll handler
    onScrollOrResize = (event) ->
      windowHeight = $window.height()
      windowWidth = $window.width()
      windowScrollTop = $window.scrollTop()
      windowBottom = windowScrollTop + windowHeight

      $nextLink.removeClass('hidden')

      if windowScrollTop < 0
        opacity = maxOpacity
      else if windowScrollTop <= bannerBottom
        opacity = maxOpacity - ((windowScrollTop / bannerBottom) * (maxOpacity - minOpacity))
      else if windowBottom < copyTop 
        opacity = minOpacity
      else if windowBottom < copyBottom 
        opacity = minOpacity + ((windowBottom - copyTop) / copyHeight * (maxOpacity - minOpacity))
      else
        opacity = maxOpacity

      $navLinks.css(opacity: opacity)

      # if next link is overlapping with ad, hide it
      if (950 < windowWidth < 1225)
        nextLinkTop = $nextLink.offset().top
        adBottom = $ad.offset().top + $ad.height() - 50 # no idea why it's 50px off...
        
        console.log(nextLinkTop, adBottom)

        if (nextLinkTop < adBottom)
          $nextLink.addClass('hidden')
        


    # throttle scroll events to reasonable rate
    $(window).scroll($.throttle(150, onScrollOrResize))
    $(window).resize($.throttle(150, onScrollOrResize))
    onScrollOrResize();



