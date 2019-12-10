$(function() {
  
  $('.input-image-box').change(function(){
    //フォームに入れた画像の確認用
    console.log(image)
    console.log(image.files[0]);
    
    //フォームに入れた画像を表示するためのurlを作る
    var image_path = URL.createObjectURL(image.files[0]);
    var html = `<div class="image-preview-box" >
                  <img src="${image_path}" class="image-preview"height="64" width="114" >
                </div>`
    $('.preview').append(html);
    URL.revokeObjectURL(".image_preview.src");

  });

  $('.form-btn').onclick(function(){
    console.log("a")


  });

    
 
});