//= require jquery.bootstrap-growl.min.js

const defaultMessage = 'Faltou informar o parâmetro noticeMessage'

function showNotice(noticeMessage = defaultMessage, type) {
  $.bootstrapGrowl(noticeMessage, {
    type: type,
    offset: { from: 'top', amount: 20 },
    align: 'right',
    width: 250,
    delay: 4000,
    allow_dismiss: true,
    stackup_spacing: 10
  });
}