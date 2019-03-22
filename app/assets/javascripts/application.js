// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery.min
//= require bootstrap.bundle.min
//= require feather.min
//= require metisMenu.min
//= require perfect-scrollbar.min
//= require swiper.min
//= require noty.min
//= require jquery.countdown.min
//= require script.min
//= require_tree .

$(document).ready(function(){
  setTimeout(function(){
    $('#flash').remove();
  }, 5000);

  App.rating()



  $('.post_list_layout').click(function (event) {
    $('#grid-layout').attr('hidden', true);
    $('#list-layout').attr('hidden', false);
    $('.post_list_layout').removeClass('btn-outline-primary').addClass('btn-primary');
    $('.post_grid_layout').removeClass('btn-primary').addClass('btn-outline-primary');
    event.preventDefault();
  })
  $('.post_grid_layout').click(function (event) {
    $('#grid-layout').attr('hidden', false);
    $('#list-layout').attr('hidden', true);
    $('.post_grid_layout').removeClass('btn-outline-primary').addClass('btn-primary');
    $('.post_list_layout').removeClass('btn-primary').addClass('btn-outline-primary');
    event.preventDefault();
  })
});


