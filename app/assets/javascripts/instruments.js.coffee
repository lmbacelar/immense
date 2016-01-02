$(document).on 'focus', '#instrument_manufacturer_name', ->
  $('#instrument_manufacturer_name').autocomplete
    source: $('#instrument_manufacturer_name').data('autocomplete-source')
    minLength: 2

$(document).on 'focus', '#instrument_modl_name', ->
  $('#instrument_modl_name').autocomplete
    source: $('#instrument_modl_name').data('autocomplete-source')
    minLength: 2

$(document).on 'focus', '#instrument_department_name', ->
  $('#instrument_department_name').autocomplete
    source: $('#instrument_department_name').data('autocomplete-source')
    minLength: 2
