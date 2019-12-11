$(function() {
  let sub_obj = $(".item__show__content__img__sub img");

  sub_obj_array = Array.prototype.slice.call(sub_obj);

  let main_obj = $(".disp-none-main");
  let index;
  $(".item__show__content__img__sub img").click(function(){
    let current = $(".disp-active-main");
    current.addClass("disp-none-main");
    current.removeClass("disp-active-main");    

    index = sub_obj_array.indexOf(this);
    main_obj[index].classList.remove("disp-none-main");
    main_obj[index].classList.add("disp-active-main");
    
  });
});