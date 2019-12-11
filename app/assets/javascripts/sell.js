$(function() {

  
  let image_array = new Array();//配列の宣言送信時に初期化する

  //フォームに入れた画像を表示
  $('.input-image-box').change(function(){
    
    var a = image.files.length
    console.log(a)
    if (image.files.length == 1){
      //条件が真の時
      //フォームに入れた画像を表示するためのurlを作る
    var image_path = URL.createObjectURL(image.files[0]);
    var html = `<div class="image-preview-box" >
                  <img src="${image_path}" class="image-preview"height="64" width="114" >
                </div>`
    $('.preview').append(html);
    URL.revokeObjectURL(".image_preview.src");
    }
    else{
      console.log("画像が２つ以上です")
      console.log(image.files)
      
      $.each(image.files,function(index, value){
        console.log(index + ":" + value)
        var image_path = URL.createObjectURL(value);
        var html = `<div class="image-preview-box" >
                  <img src="${image_path}" class="image-preview"height="64" width="114" >
                </div>`
        $('.preview').append(html);

      })
    }
  });

  


  //手数料の計算
  $('.price').change(function(){
    //フォームに入れた数字
    var price = $(this).val()
    //手数料
    var charge = parseInt(price)*0.10;
    //販売利益
    var profit = parseInt(price)-parseInt(charge)
    $('.charge__result').append(charge);
    $('.profit__result').append(profit);
  });
  
  
});