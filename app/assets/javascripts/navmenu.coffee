# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
    $('#nav-icon3').click ->
        $(this).toggleClass('open')
        if !$(this).hasClass('open')
          document.getElementById("mySidenav").style.width = "0px"
          document.getElementById("main").style.marginLeft = "0px"
        else
          document.getElementById("mySidenav").style.width = "250px"
          document.getElementById("main").style.marginLeft= "250px"
    
  
    
