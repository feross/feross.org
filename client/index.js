var $ = require('jquery')
var addCommas = require('add-commas')
var throttle = require('throttleit')

// The global jQuery instance is used by some posts
window.$ = window.jQuery = $

$(document).ready(function () {
  // If this is homepage, get view count for all posts
  if ($('body').hasClass('home')) {
    $.ajax({
      type: 'GET',
      url: '/views/total',
      dataType: 'json',
      success: function (data) {
        var views = addCommas(data.views)
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
    if (!slug) return console.error('missing view slug')
    if (slug[slug.length - 1] === '/') slug = slug.slice(0, slug.length - 1)
    $.ajax({
      type: 'POST',
      url: '/views',
      data: { slug: slug },
      dataType: 'json',
      success: function (data) {
        var views = addCommas(data.views)
        $('.views').text(views + ' views')
      },
      error: function (data) {
        $('.views').text('Lots of views')
      }
    })
  }

  if ($('body').hasClass('about')) {
    var ageInDays = Math.floor((new Date() - new Date('1990-10-29T00:00:01.000Z')) / 1000 / 60 / 60 / 24)
    var ageInYears = Math.floor(ageInDays / 365)
    $('#ageInDays').html(' &mdash; that\'s ' + ageInDays + ' days to be exact!')
    $('#ageInYears').text(ageInYears)
  }
})

// Fade prev/next post links on scroll
if ($('body').hasClass('post')) {
  var maxOpacity = 0.7
  var minOpacity = 0.2

  var $header = $('#header')
  var headerBottom = $header.offset().top + $header.height()

  var $meta = $('.meta')
  var $copy = $('.copy')
  var copyOffset = 100 // start fading in a little early
  var copyTop = $meta.offset().top - copyOffset // using meta, since that includes h3
  var copyBottom = $copy.offset().top + $copy.height() - copyOffset
  var copyHeight = copyBottom - copyTop

  var $window = $(window)
  var $navLinks = $('.prev, .next')
  var $nextLink = $('.next')
  var $ad = $('.carbonad')

  var onScrollOrResize = function (event) {
    var windowHeight = $window.height()
    var windowWidth = $window.width()
    var windowScrollTop = $window.scrollTop()
    var windowBottom = windowScrollTop + windowHeight

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
    if ($nextLink.length && windowWidth > 950 && windowWidth < 1225) {
      var nextLinkTop = $nextLink.offset().top
      var adBottom = $ad.offset().top + $ad.height() - 50 // no idea why it's 50px off...
      if (nextLinkTop < adBottom) {
        $nextLink.addClass('hidden')
      }
    }
  }

  window.addEventListener('scroll', throttle(onScrollOrResize, 150))
  window.addEventListener('resize', throttle(onScrollOrResize, 150))
  onScrollOrResize()
}
