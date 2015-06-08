// Load jQuery data 

$(document).on('page:load', ready);
$(document).on('page:change', ready);
$(document).ready(ready);

var ready = function () {

  // Datepicker 
  $('.datepicker').datepicker({
    format: 'M dd yyyy',
    orientation: 'left'
  });
};
