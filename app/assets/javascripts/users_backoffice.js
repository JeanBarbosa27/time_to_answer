// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//= require users_backoffice/vendors
//= require helpers/message-center

(function() {
  const yearRangeStart = new Date().getFullYear() - 100
  const yearRangeEnd = new Date().getFullYear()

  // Initialize datepicker in a input just to user interaction
  $('[data-datepicker="apply"]').datepicker({
    changeYear: true,
    dateFormat: 'dd/mm/yy',
    dayNamesMin: [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb' ],
    monthNames: [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ],
    yearRange: `${yearRangeStart}:${yearRangeEnd}`
  })

  // When datepicker is selected, parse to a valid date to bithdate input
  $('[data-datepicker="apply"]').on('change', ({ target }) => {
    const parseValidDate = target.value.split('/').reverse().join('-')
    $('#user_user_profile_attributes_birthdate')[0].value = parseValidDate
  })
})()