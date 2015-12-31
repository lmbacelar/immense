$(document).on 'focus', '#instrument_department_name', ->
  $('#instrument_department_name').autocomplete
    source: $('#instrument_department_name').data('autocomplete-source')
    minLength: 2
