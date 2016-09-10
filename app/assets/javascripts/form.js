$(document).on('page:change', function() {
    $('#newaccount').prop('disabled', true);
    
    $(".signup").on("click",function(){
      if($("#engineer_field").hasClass("invisible"))
      {
        $("#engineer_field").removeClass("invisible");
      }
      else{
        $("#engineer_field").addClass("invisible");
        $('select').prop('selectedIndex', 0);
      }
    });
    
     $('#acceptterms').click(function() {
       $('#newaccount').prop('disabled', !$('#acceptterms').prop('checked'));
    });
    
    
});