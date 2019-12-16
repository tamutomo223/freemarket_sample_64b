$(function() {
  let images = [];
  let form =[];
  function buildHTML(imgSrc){
    let html =  `<div class="preview-box">
                   <div class="preview-box__img-box">
                    <img src="${imgSrc}" "height="64" width="114">
                  </div>
                  <div class="preview-box__select">
                     <div class="preview-box__select--edit">
                    <p>編集</p>
                  </div>
                  <div class="preview-box__select--delete">
                    <p>削除</p>
                  </div>
                </div>
              </div>`
    $('.preview').prepend(html);
  };

  $('.input-image-box').change(function(e){
    a = $('.input-image-box').val();
    form.push(a);
    console.log("フォームの中身は")
    console.log(a)
    console.log("送信用フォームの中身は")
    console.log(form)
    let files = e.target.files;
    for (var i = 0, f; f = files[i]; i++){
      let reader = new FileReader();
      reader.readAsDataURL(f);
      reader.onload = function(){
        let imgSrc = reader.result;
        buildHTML(imgSrc);
        images.push(imgSrc);
        console.log("表示用配列の中身は")
        console.log(images)
        $('.input-image-box').val(form);

    }
    }
  })
  $('.input-image-box').on('drop', function(e) {
    
    e.preventDefault();
    e.stopPropagation();
    let dropImages = e.originalEvent.dataTransfer.files;
      for(let i = 0; i < dropImages.length; i++ ) {
        let imgSrc = URL.createObjectURL(dropImages[i]);
        buildHTML(imgSrc);
        images.push(dropImages[i].name);
      }
  });
  $(document).on('click', '.preview-box__select--delete p', function(){
    $(this).closest('.preview-box').remove();

  });

  //手数料の計算
  $('.price').change(function(){
    //フォームに入れた数字
    var price = $(this).val()
    
    //手数料
    var charge = parseInt(price)*0.10;
    
    //販売利益
    var profit = parseInt(price)-parseInt(charge)
    $('.charge__result').html(charge)
   
    $('.profit__result').append(profit)
   
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
