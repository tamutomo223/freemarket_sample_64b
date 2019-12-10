$(function() {
  //画像複数保存用の配列
  //if(document.URL.match("/sell")){
    //window.onload = function(){
    //alert('配列作成');
    //console.log(image_array)
    //}
  
  let image_array = new Array();//配列の宣言送信時に初期化する

  //フォームに入れた画像を表示
  $('.input-image-box').change(function(){
    //フォームに入れた画像の確認用
    var a = $(".input-image-box").val()
    console.log(a)
    console.log(image.files[0]);
    //フォームに入れた画像を表示するためのurlを作る
    var image_path = URL.createObjectURL(image.files[0]);
    var html = `<div class="image-preview-box" >
                  <img src="${image_path}" class="image-preview"height="64" width="114" >
                </div>`
    $('.preview').append(html);
    URL.revokeObjectURL(".image_preview.src");

    //画像の複数保存
    image_array.push(image_path);
    console.log(image_array)

  });

  


  //手数料の計算
  $('.price').change(function(){
    //フォームに入れた数字
    var price = $(this).val()
    console.log(`フォームに入れた数字は${price}`)

    //手数料
    var charge = parseInt(price)*0.10;
    console.log(`手数料は${charge}`)

    //販売利益
    var profit = parseInt(price)-parseInt(charge)
    console.log(`販売利益は${profit}`)
    $('.charge__result').append(charge);
    $('.profit__result').append(profit);
  });
  
  
});