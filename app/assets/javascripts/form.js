$(document).on('page:change', function() {
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
});