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
 })



$(function () {

  App.rating()
  App.atcDemo()
  App.atwDemo()
  App.colorOption()

  setTimeout(function (argument) {
    var productSlider = new Swiper('#product-slider', {
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    })
  }, 100)

  // Collect items for photoswipe
  var items = []
  $('.swiper-wrapper img').each(function () {
    items.push({
      src: $(this).data('large'),
      w: 1395,
      h: 1500
    })
  })

  var openPhotoSwipe = function (items, activeIndex) {
    activeIndex = typeof activeIndex !== 'undefined' ? activeIndex : 0
    var pswpElement = document.querySelectorAll('.pswp')[0]
    var options = {
      index: activeIndex
    }
    var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options)
    gallery.init()
  }

  $('.zoom').click(function () {
    openPhotoSwipe(items, $('.swiper-wrapper').find('.swiper-slide-active').data('swiper-slide-index'))
  })

})


