# omg, coffeescript, so tasty

addCommasToInteger = (x) ->
  x += ''
  rgx = /(\d+)(\d{3})/
  while rgx.test(x)
    x = x.replace(rgx, '$1' + ',' + '$2')
  x

$ ->
  # Make external links open in new window
  $("a[href^='http:']")
    .not("[href*='feross.org']")
    .attr('target','_blank')

  # If this is a post, get view count
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
        console.log views
        $('.views').text("#{views} views")
      error: (data) ->
        console.log 'error'
        $('.views').text('Lots of views')


  # Fade prev/next post links on scroll

  # constants
  maxOpacity = 0.8
  minOpacity = 0.15
  $banner = $('[role="banner"]')
  bannerBottom = $banner.offset().top + $banner.height()
  $navLinks = $('.prev, .next')
  $meta = $('.meta')
  $copy = $('.copy')
  copyOffset = 200 # start fading in a little early
  copyTop = $meta.offset().top - copyOffset # using meta, since that includes h3
  copyBottom = $copy.offset().top + $copy.height() - copyOffset
  copyHeight = copyBottom - copyTop

  # scroll handler
  onScroll = (event) ->
    $window = $(window)
    windowHeight = $window.height()
    windowTop = $window.scrollTop()
    windowBottom = windowTop + windowHeight

    if windowTop <= bannerBottom
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



