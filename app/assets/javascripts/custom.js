var ready = function () {

  // Datepicker 
  $('.datepicker').datepicker({
    format: 'M dd yyyy',
    orientation: 'left'
  });
  
  $("#file").filestyle({buttonname: "btn-primary"});
  
};

// Load jQuery data 
$(document).ready(ready);
$(document).on('page:load', ready);