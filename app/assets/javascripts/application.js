// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
////
$(document).ready(function(){

  $("body").on("click", ".raccoon-off", function(){

      $('.placement').slideUp(350, function(){
      $(".raccoon-fo").css({'z-index' : '-5', 'opacity' : '0'});
       });
    });

  $("body").on("click", ".furniture", function(){
    $('.furniture-form').slideDown(350);
    $(".furniture").css({'display' : 'none'});
   });

});
