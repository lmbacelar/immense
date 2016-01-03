$(document).on 'focus', '#instrument_brand', ->
  $('#instrument_brand').autocomplete
    source: '/brands/autocomplete'
    minLength: 2

$(document).on 'focus', '#instrument_model', ->
  $('#instrument_model').autocomplete
    source: (request, response) ->
      $.getJSON '/models/autocomplete', { brand_name: $('#instrument_brand').val(), term: $('#instrument_model').val() }, response
      return
    minLength: 2

$(document).on 'focus', '#instrument_department', ->
  $('#instrument_department').autocomplete
    source: '/departments/autocomplete'
    minLength: 2
