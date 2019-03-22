# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
  });