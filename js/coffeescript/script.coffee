# omg, coffeescript

# window.FEROSS = {}

$ ->
  # Suppress typographic widows
  # (adapted from jQWidon't - http://davecardwell.co.uk/javascript/jquery/plugins/jquery-widont/)
  $('h1,h2,h3,li,p').each ->
    $(this).html $(this).html().replace(/\s([^\s<]+)\s*$/,"&nbsp;$1")

  # If this is a post, get view count
  if $('body').hasClass('post')
    slug = $('.views').data('slug')
    $.post('http://localhost:3000/views', slug: slug)
      .success (data) ->
        alert(data)
        $('.views').text("#{data.views} views")