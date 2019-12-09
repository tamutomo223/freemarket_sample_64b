class ItemsController < ApplicationController
  def index

  end  

  def sell

    @item = Item.new
    @item.images.build


  end

  def show


  end  

  def exhibit
    @item = Item.new(item_params)
    @item.save
    #@image = Image.create(item_id: @item.id, image_url:image_params[:image_url])
  end

  private
  def item_params
    #次の4つは本来は出品ページから入れる物ではないため、昨日実装後に削除
    #:order_id,:user_id,:size_type,:view
    #params.require(:item).permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:order_id,:user_id,:size_type,:view,
      #images_attributes:[:imege_url])
    params.require(:item).permit!
    # params.require(:item).permit(:item_name, images_attributes:[:item][:images_attributes]["0"][:imege_url])
  end

  def image_params(params)
    params.permit(:image_url)
  end
end
