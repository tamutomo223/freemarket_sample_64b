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
    binding.pry
    @item = Item.new(item_params)
    @item.save
    params[:images][:image_url].each do |i|
      @item.images.create!(image_url: i,item_id:@item.id)
    end
    

    # def self.create_items_by(item_params)
    #   item_params[:image_url].each do |image|
    #     new_item = Item.new(item_name:item_params[:item_name],explain:item_params[:explain],status:item_params[:status],fee:item_params[:fee],s_prefecture:item_params[:s_prefecture],s_date:item_params[:s_date],price:item_params[:price],size:item_params[:size],category_id:item_params[:category_id],brand_id:item_params[:brand_id],order_id:item_params[:order_id],
    #       user_id:item_params[:user_id],size_type:item_params[:size_type],view:item_params[:view],image_url: image)
    #     return false unless new_photo.save!
    #   end
    # end

    #@image = Image.create(item_id: @item.id, image_url:image_params[:image_url])
  end

  private
  def item_params
    #次の4つは本来は出品ページから入れる物ではないため、昨日実装後に削除
    #:order_id,:user_id,:size_type,:view
    params.require(:item).permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:order_id,:user_id,:size_type,:view)
    
    #params.require(:item).permit!
    
      # params.require(:item).permit(:item_name, images_attributes:[:item][:images_attributes]["0"][:imege_url])
  end

  def image_params(params)
    params.permit(:image_url)
  end
end
