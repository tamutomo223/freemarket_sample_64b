class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:images).order("created_at DESC").limit(10)
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
    if @item.save
      params[:images][:image_url].each do |i|
        @item.images.create!(image_url: i,item_id:@item.id)
      end
      redirect_to root_path
    else
      #画像フォーム消えることを防ぐため
      @item.images.build
      render :sell
    end
  end

  private
  def item_params
    #次の4つは本来は出品ページから入れる物ではないため、機能実装後に削除
    #:order_id,:user_id,:size_type,:view
    params.require(:item).permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:order_id,:user_id,:size_type,:view)
  end

  def image_params(params)
    params.permit(:image_url)
  end
end
