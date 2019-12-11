class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.includes(:images).order("created_at DESC").limit(10)
  end  

  def sell

    @item = Item.new
    @item.images.build
    @categories = Category.all.order("id ASC")

  end

  def buy
  end

  def show

  end  

  def exhibit
    binding.pry
    @item = Item.new(item_params)
    @item.save
    params[:images][:image_url].each do |i|
      @item.images.create!(image_url: i,item_id:@item.id)
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

  def set_item
    @item = Item.find(params[:id])
  end
end

