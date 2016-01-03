$(document).on 'focus', '#instrument_manufacturer_name', ->
  $('#instrument_manufacturer_name').autocomplete
    source: '/manufacturers/autocomplete'
    minLength: 2

$(document).on 'focus', '#instrument_modl_name', ->
  $('#instrument_modl_name').autocomplete
    source: '/models/autocomplete'
    minLength: 2

$(document).on 'focus', '#instrument_department_name', ->
  $('#instrument_department_name').autocomplete
    source: '/departments/autocomplete'
    minLength: 2
