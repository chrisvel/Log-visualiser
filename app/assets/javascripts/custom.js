var ready = function () {

  // Datepicker 
  $('.datepicker').datepicker({
    format: 'M dd yyyy',
    orientation: 'left'
  });
  
  
};

// Load jQuery data 
$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:change', ready);