$(function() {
  
  
  if ($("select#Customer").val() == "") {
    $("select#Building").hide();
    $("select#Battery").hide();
    $("select#Column").hide();
    $("select#Elevator").hide();
    $("#description").hide();
    $("select#Employee").hide();
    $("h4").hide();




  } 
  // get building for specific customer
  $("select#Customer").change(function(){
    $("h4").hide();
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
        //  get batery for specific building
         $("select#Building").change(function(){
          $("h4").hide();
          var id_value_string = $(this).val();
          if (id_value_string == ""){
              $("select#Battery").hide();
             $("select#Column").hide();
             $("select#Elevator").hide();
           }
           $.ajax({
            dataType: "json",
            cache: false,
            url: '/get_baterry_by_building/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error) {
              alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function(data){
              $("select#Battery").show();
              $("#description").show();
              $("select#Employee").show();
              // Clear all options from Battery select
              $("select#Battery option").remove();
              //put in a empty default line
              var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
              $(row).appendTo("select#Battery");
               // Fill course select
               $.each(data, function(i, j) {
                row = "<option value=\"" + j.id + "\">" + "Batterry id: " +  j.id + "</option>";
                $(row).appendTo("select#Battery");
              });
                // get column to a specific batterry
                $("select#Battery").change(function(){
                  $("h4").hide();
                   var id_value_string = $(this).val();
                   if (id_value_string == ""){
                    $("select#Column").hide();
                    $("#description").hide();

                  }
                  $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/get_column_by_battery/' + id_value_string,
                    timeout: 5000,
                    error: function(XMLHttpRequest, errorTextStatus, error) {
                      alert("Failed to submit : " + errorTextStatus + " ;" + error);
                    },
                    success: function(data){
                      $("select#Column").show();
                     $("#description").show();
                      // Clear all options from Column select
                      $("select#Column option").remove();
                       //put in a empty default line
                      var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
                      $(row).appendTo("select#Column");
                      // Fill course select
                      $.each(data, function(i, j){
                        row = "<option value=\"" + j.id + "\">" + "Column id: " +  j.id + "</option>";
                        $(row).appendTo("select#Column");
                      });
                      // get Elevator for specific column
                      $("select#Column").change(function(){
                        $("h4").hide();
                         var id_value_string = $(this).val();
                         if (id_value_string == ""){
                          $("select#Elevator").hide();
                        }
                        $.ajax({
                          dataType: "json",
                          cache: false,
                          url: '/get_elevator_by_column/' + id_value_string,
                          timeout: 5000,
                          error: function(XMLHttpRequest, errorTextStatus, error) {
                            alert("Failed to submit : " + errorTextStatus + " ;" + error);
                          },
                          success: function(data){
                            $("select#Elevator").show();
                            $("select#Elevator").show();
                            // Clear all options from Column select
                            $("select#Elevator option").remove();
                            //put in a empty default line
                            var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
                            $(row).appendTo("select#Elevator");
                            // Fill course select
                            $.each(data, function(i, j){
                               row = "<option value=\"" + j.id + "\">" + "Elevator id: " +  j.id + "</option>";
                               $(row).appendTo("select#Elevator");
                            });
                          }
                        });
                      });
                    }

                  });
                });
            }
           })
         });
    }
    });
    
  }); 
  $("select#Elevator").change(function(){
    $("h4").hide();

  });
  $("form").submit(function(){
    $("h4").show();
   })
 });