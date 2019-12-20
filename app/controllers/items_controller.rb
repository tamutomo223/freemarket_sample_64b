class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :edit_input, :update]
  before_action :set_categories, only:[:sell, :edit_input]
  before_action :set_myself_items
  require 'payjp'

  def index
    @items = Item.all.includes(:images).order("created_at DESC").limit(10)
    @category = Category.all

  end  

  def sell

    @item = Item.new
    @item.images.build

  end

  def buy
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.find(params[:id])
    image = @item.images[0]
    @image = image.image_url
    @card = Card.where(user_id: current_user.id).first
    unless @card.blank?
      Payjp.api_key = 'sk_test_853b0c9300ad1412a28612e8'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    @user = current_user
    @shippings = @user.shippings
    @shipping = @shippings[0]
    @yubin = @shipping.address_number
    @prefecture = Prefecture.find(@shipping.prefecture_id)
    @prefecture_name = @prefecture.name
    @city = @shipping.city
    @town = @shipping.town
    @name1 = @shipping.s_family_name 
    @name2 =  @shipping.s_first_name 
  end



  def buy_create
    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id).first
    @order = Order.new(order_params)
    if @order.save
      @item.update(order_id: @order.id)
    Payjp.api_key = "sk_test_853b0c9300ad1412a28612e8"
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      customer: @card.customer_id, #顧客ID
      currency: 'jpy' #日本円
    )
    redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to edit_item_path(@item)
      end  
    end
    @user_item = Item.where(user_id: @item.user_id).where(order_id: 0).where.not(id: @item.id)
    @category_item = Item.where(category_id: @item.category_id).where(order_id: 0).where.not(id: @item.id)
    @next_item = Item.find_by(id: @item.id.to_i + 1)
    @prev_item = Item.find_by(id: @item.id.to_i - 1)
  end

  def edit
  end

  def edit_input
  end

  def update
    image_flg =  set_image_flg
    if @item.update(item_params) && (params[:images] != nil)
      params[:images][:image_url].each_with_index do |image, i|
        if !image_flg.include?(i.to_s)
          @item.images.create!(image_url: image,item_id: @item.id)
        end
      end
      redirect_to edit_item_path(params[:id])
    else
      #画像フォームが消えることを防ぐため
      @item.images.build
      redirect_to edit_item_path(params[:id])
    end
    
  end

  def exhibit
    @item = Item.new(item_params)
    image_flg = set_image_flg
    
    if @item.save
      params[:images][:image_url].each_with_index do |image, i|
        if !image_flg.include?(i.to_s)
          @item.images.create!(image_url: image,item_id:@item.id)
        end
      end
      redirect_to root_path
    else
      #画像フォーム消えることを防ぐため
      @item.images.build
      @categories = Category.all.order("id ASC")
      render :sell
    end
  end

  def destroy
    if Item.find(params[:id]).destroy
      redirect_to mypage_listings_users_path
    else
      redirect_to edit_item_path(params[:id])
    end
    
  end

  private
  def item_params
    #次の4つは本来は出品ページから入れる物ではないため、機能実装後に削除
    #:order_id,:user_id,:size_type,:view
    params.require(:item).permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:order_id,:user_id,:size_type,:view, images_attributes: [:image_url, :id, :_destroy])

  end

  def set_image_flg
    params.require(:item).permit(:image_flg)["image_flg"].split(",")
  end

  def image_params(params)
    params.permit(:image_url)
  end

  def order_params
    params.permit(:user_id,:item_id,:progress)
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @categories = Category.order("id ASC")
  end

  def set_myself_items
    if user_signen_in?
      @myself_items = Item.where(user_id: current_user.id)
    end  
  end
end

