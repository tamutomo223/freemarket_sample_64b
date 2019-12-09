$(function()   {
    $(".tab-A").click(function(){
      $(".tab-B").removeClass("active");
      $(".tab-A").addClass("active");
      $(".list-A").removeClass("show-none");
      $(".list-B").addClass("show-none");
    });
    $(".tab-B").click(function(){
      $('.tab-A').removeClass("active");
      $(".tab-B").addClass("active");
      $(".list-B").removeClass("show-none");
      $(".list-A").addClass("show-none");
    })

    $(".tab-C").click(function(){
      $(".tab-D").removeClass("active");
      $(".tab-C").addClass("active");
      $(".list-C").removeClass("show-none");
      $(".list-D").addClass("show-none");
    });
    $(".tab-D").click(function(){
      $('.tab-C').removeClass("active");
      $(".tab-D").addClass("active");
      $(".list-D").removeClass("show-none");
      $(".list-C").addClass("show-none");
    })
  });
