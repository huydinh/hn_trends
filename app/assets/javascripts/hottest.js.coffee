$ ->
  settings =
    "size" :
      "grid" : 16
    ,
    "options" :
      "color" : "random-dark",
      "printMultiplier" : 3
      'sort': 'random'
    ,
    "font" : "Futura, Helvetica, sans-serif",
    "shape" : "circle"

  $( "#wordcloud" ).awesomeCloud( settings )
