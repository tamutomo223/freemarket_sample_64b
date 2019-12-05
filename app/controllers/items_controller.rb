class ItemsController < ApplicationController
  def index

  end  

  def sell
    @item = Item.new
  end  

  def exhibit
    Item.create(item_params)
  end

  private
  def item_params
    #次の５つは本来は出品ページから入れる物ではないため、昨日実装後に削除
    #:seller,:order_id,:user_id,:size_type,:view
    params.permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:seller,:order_id,:user_id,:size_type,:view)
  end
end
