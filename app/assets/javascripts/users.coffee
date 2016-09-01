# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleIt = (element) ->
  if this.checked? 
     $(".engineer_field").display = all
  else
      $(".engineer_field").display = none 
