$(function() {
  let image_array = new Array();//配列の宣言送信時に初期化する

  //フォームに入れた画像を表示
  $('.input-image-box').change(function(){
    
    if (image.files.length == 1){
      //画像が一枚だけの時
      //フォームに入れた画像を表示するためのurlを作る
    var image_path = URL.createObjectURL(image.files[0]);

    //表示するhtmlの作成
    var html = `<div class="image-preview-box" >
                  <img src="${image_path}" class="image-preview"height="64" width="114" >
                </div>`
    //htmlをビューへ追加
    $('.preview').html(html);
    URL.revokeObjectURL(".image_preview.src");
    }
    else{
      //画像が複数の時
      $.each(image.files,function(index, value){
        //フォームに入れた画像を表示するためのurlを作る
        var image_path = URL.createObjectURL(value);

        //表示するhtmlの作成
        var html = `<div class="image-preview-box" >
                  <img src="${image_path}" class="image-preview"height="64" width="114" >
                </div>`
        //htmlをビューへ追加
        $('.preview').append(html);
        URL.revokeObjectURL(".image_preview.src");
      })
    }
  });

  


  //手数料の計算
  $('price_field').change(function(){
    //フォームに入れた数字
    var price = $(this).val()
    
    //手数料
    // debugger;
    //販売利益
    var profit = Math.round(price * 0.9)//(price)-parseInt(charge)
    var charge = (price - profit)//parseInt(price)*0.10;
    $('.charge__result').html(charge)
   
    $('.profit__result').html(profit)
   
  });

  //画像バリデーション
  $('#new_item').submit(function() {
    
    
    if (image.files.length == 0) {
      $('.image-error').html("画像がありません")
      return false; 
    } else {
      
      return true; 
    }
  })
  

});
