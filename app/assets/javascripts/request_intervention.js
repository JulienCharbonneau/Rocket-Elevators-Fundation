$(function() {
  console.log($("select#Customer").val());
  
  if ($("select#Customer").val() == "") {
    $("select#Building").hide();
    $("select#Battery").hide();
    $("select#Column").hide();
    $("select#Elevator").hide();
  } 
  $("select#Customer").change(function(){
    var id_value_string = $(this).val();
    if (id_value_string == ""){
      $("select#Building").hide();
      $("select#Battery").hide();
      $("select#Column").hide();
      $("select#Elevator").hide();
    }
    $.ajax({
      dataType: "json",
      cache: false,
      url: '/get_building_by_customer/' + id_value_string,
      timeout: 5000,
      error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
      },
      success: function(data) {
        
         console.log(data[0].id + "================")
         $("select#Building").show();
         // Clear all options from building select
       $("select#Building option").remove();
       //put in a empty default line
       var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
       $(row).appendTo("select#Building");
       // Fill course select
       $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.buildingAddress + "</option>";
        $(row).appendTo("select#Building");
      });
    }
    });
    
  }); 

 });