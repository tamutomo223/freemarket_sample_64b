$(function() {
  $('.slide').slick({
  dots: true,
  autoplay: true,
  autoplaySpeed: 6000,

  }); 

  $(".top__header__content__2__left__category").hover(function(){
    $(".hidden__category").removeClass("none")
  },function(){
    $(".hidden__category").addClass("none")
  });
});