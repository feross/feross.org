# omg, coffeescript

addCommasToInteger = (x) ->
  x += ''
  rgx = /(\d+)(\d{3})/
  while rgx.test(x)
    x = x.replace(rgx, '$1' + ',' + '$2')
  x

$ ->
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