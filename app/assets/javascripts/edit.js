$(function () {
  
  let image_obj = $(".input-image-drop");
  let drop_zone = $(".drop-zone");
  // debugger;
  for(let i = 0; i < image_obj.length; i++){
    // 出品画面で登録した枚数分、アップロードするエリアが表示されてしまうため、一つのエリアだけ残し、非表示を行う。
    if (i != 0){
      image_obj.eq(i).addClass("input-image-drop-none");
      drop_zone.eq(i).remove();
      // ドラッグ＆ドロップエリアのゾーンは削除を行う。
      // image_objを非表示ではなく、削除してしまうと、「下記の削除ボタンが押下された場合」の処理に影響が出てしまうため、削除はしない。
    }
  };

  // 出品画像の削除ボタンが押下された場合
  let target_obj = ".image-preview-box__wrapper--destroy"
  $(target_obj).on("click", function(){
    let index = $(this).attr("data-index");
    let check_box = $(`[id *= ${index}__destroy]`);
    check_box.prop("checked", true);

    ipb_none = "image-preview-box-none";
    // 画像と画像の間のスペースを削除する。
    let space = $(".image-preview-space");
    space.filter(function(){
      let space_index = $(this).attr("data-space");
      if (space_index === index){
        $(this).addClass(ipb_none);
      }
    });
    
    $(this).parents(".image-preview-box").remove();
  });

  // 画像が全て削除した状態で、「変更する」を押下した場合のエラーメッセージの表示について
  let image_error = $(".image-error");
  for (let i = 0; i < image_error.length; i++){
    if (i != 0){
      image_error.eq(i).remove();
    };
  };
});