function addCommasToInteger(x) {
  var rgx = /(\d+)(\d{3})/
  x += ''

  while (rgx.test(x)) {
    x = x.replace(rgx, '$1' + ',' + '$2')
  }
  return x
}

$(document).ready(function () {
  // If this is homepage, get view count for all posts
  if ($('body').hasClass('home')) {
    $.ajax({
      type: 'GET',
      url: '/views/total',
      dataType: 'json',
      success: function (data) {
        var views = addCommasToInteger(data.views)
        $('.views').text(views)
      },
      error: function (data) {
        $('.views').text('Lots of')
      }
    })
  }

  // If this is a post, get post view count
  if ($('body').hasClass('post')) {
    var slug = $('.views').data('slug')
    $.ajax({
      type: 'POST',
      url: '/views',
      data: {slug: slug},
      dataType: 'json',
      success: function (data) {
        var views = addCommasToInteger(data.views)
        $('.views').text(views + " views")
      },
      error: function (data) {
        $('.views').text('Lots of views')
      }
    })
  }
})

$(window).load(function () {

  // Fade prev/next post links on scroll
  if ($('body').hasClass('post')) {

    var maxOpacity = 0.8
      , minOpacity = 0.3
      
      , $header = $('#header')
      , headerBottom = $header.offset().top + $header.height()

      , $meta = $('.meta')
      , $copy = $('.copy')
      , copyOffset = 100 // start fading in a little early
      , copyTop = $meta.offset().top - copyOffset // using meta, since that includes h3
      , copyBottom = $copy.offset().top + $copy.height() - copyOffset
      , copyHeight = copyBottom - copyTop

      , $window = $(window)
      , $navLinks = $('.prev, .next')
      , $nextLink = $('.next')
      , $ad = $('.carbonad')

    // scroll handler
    var onScrollOrResize = function (event) {
      var windowHeight = $window.height()
        , windowWidth = $window.width()
        , windowScrollTop = $window.scrollTop()
        , windowBottom = windowScrollTop + windowHeight

      $nextLink.removeClass('hidden')

      var opacity
      if (windowScrollTop < 0) {
        opacity = maxOpacity
      } else if (windowScrollTop <= headerBottom) {
        opacity = maxOpacity - ((windowScrollTop / headerBottom) * (maxOpacity - minOpacity))
      } else if (windowBottom < copyTop) {
        opacity = minOpacity
      } else if (windowBottom < copyBottom) {
        opacity = minOpacity + ((windowBottom - copyTop) / copyHeight * (maxOpacity - minOpacity))
      } else {
        opacity = maxOpacity
      }

      $navLinks.css({opacity: opacity})

      // if next link is overlapping with ad, hide it
      if ($nextLink.length && 950 < windowWidth && windowWidth < 1225) {
        var nextLinkTop = $nextLink.offset().top
          , adBottom = $ad.offset().top + $ad.height() - 50 // no idea why it's 50px off...
        if (nextLinkTop < adBottom) {
          $nextLink.addClass('hidden')
        }
      }
    }

    // throttle scroll events to reasonable rate
    $(window).scroll($.throttle(150, onScrollOrResize))
    $(window).resize($.throttle(150, onScrollOrResize))
    
    onScrollOrResize();
  }
})

