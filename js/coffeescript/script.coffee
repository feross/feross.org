# omg, coffeescript

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