# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ = jQuery
$(".neonFlicker").hover(
  ->
    alert("here")
    $(this).append($("<span> ***</span>"))
  ,
  ->
    alert("there")
    $(this).find("span:last").remove()

)

