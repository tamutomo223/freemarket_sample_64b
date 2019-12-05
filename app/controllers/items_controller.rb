class ItemsController < ApplicationController
  def index

  end  

  def sell
    @item = Item.new
    @image = Image.new
  end  

  def exhibit
    @item = Item.create(item_params)
    binding.pry
    @image = Image.create(item_id: @item.id, image_url:image_params[:image_url])
  end

  private
  def item_params
    #次の4つは本来は出品ページから入れる物ではないため、昨日実装後に削除
    #:order_id,:user_id,:size_type,:view
    params.permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:order_id,:user_id,:size_type,:view)
  end
  def image_params
    params.require(:images).permit(:image_url)
  end
end
