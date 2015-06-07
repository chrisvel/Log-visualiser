var ready = function () {

  // Datepicker 
  $('.datepicker').datepicker({
    format: 'M dd yyyy',
    orientation: 'left'
  });

  //
  // Setup Tickets per day of week chart
  //
  var data = [
    {
        value: $('#MyPieChart').data('removed'),
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Removed"
    },
    {
        value: $('#MyPieChart').data('installed'),
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Installed"
    },
    {
        value: $('#MyPieChart').data('updated'),
        color: "#FDB45C",
        highlight: "#FFC870",
        label: "Updated"
    }
  ]
  
  myNewChart = new Chart($("#MyPieChart").get(0).getContext("2d")).Pie(data);
};

// Load jQuery data 
$(document).ready(ready);
$(document).on('page:load', ready);