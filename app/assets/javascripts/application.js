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
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require application_jquery
//= require_tree .

$(document).ready(function(){
  $(function(){
    var seconds = $("h2[id=countdown]").attr("value");
    var interval = setInterval(function(){
      var hours = Math.floor(seconds/3600);
      var minutesLeft = Math.floor((seconds) - (hours*3600));
      var minutes = Math.floor(minutesLeft/60);
      var remainingSeconds = seconds % 60;
      if(hours < 10){
        hours = "0" + hours;
      }
      if(minutes < 10){
        minutes = "0" + minutes;
      }
      if(remainingSeconds < 10){
        remainingSeconds = "0" + remainingSeconds; 
      }     
      $("h2[id=countdown]").html(hours + " : " + minutes + " : " + remainingSeconds);
      if(seconds <= 0){
        clearInterval(interval);
        $("h2[id=countdown]").html("Completed");
        alert("Time up");
        $("input[name=btn_submit]").click();
      }else{
        seconds--;
      }
    }, 1000);
  });
});

$(document).on("click", "input[type=checkbox]", function () {
  $("input[type=checkbox]").not($(this)).prop("checked", false);
});
