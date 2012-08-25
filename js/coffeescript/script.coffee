# omg, coffeescript

$ ->
    # Suppress typographic widows
    # (adapted from jQWidon't - http://davecardwell.co.uk/javascript/jquery/plugins/jquery-widont/)
    $('h1,h2,h3,li,p').each ->
        $(this).html $(this).html().replace(/\s([^\s<]+)\s*$/,"&nbsp;$1")