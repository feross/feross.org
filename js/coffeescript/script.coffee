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
    $.post('/views', slug: slug)
      .success (data) ->
        views = addCommasToInteger(data.views)
        $('.views').text("#{views} views")
      .error (data) ->
        $('.views').text('Lots of views')