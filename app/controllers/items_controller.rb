class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :edit_input]
  require 'payjp'

  def index
    @items = Item.all.includes(:images).order("created_at DESC").limit(10)
    @category = Category.all
  end  

  def sell

    @item = Item.new
    @item.images.build
    @categories = Category.all.order("id ASC")

  end

  def buy
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
  end  

  def edit
  end

  def edit_input

  end

  def exhibit
    @item = Item.new(item_params)
    if @item.save
      params[:images][:image_url].each do |i|
        @item.images.create!(image_url: i,item_id:@item.id)
      end
      redirect_to root_path
    else
      @categories = Category.all.order("id ASC")
      #画像フォーム消えることを防ぐため
      @item.images.build
      @categories = Category.all.order("id ASC")
      render :sell
    end
  end

  private
  def item_params
    #次の4つは本来は出品ページから入れる物ではないため、機能実装後に削除
    #:order_id,:user_id,:size_type,:view
    params.require(:item).permit(:item_name,:explain,:status,:fee,:s_prefecture,:s_date,:price,:size,:category_id,:brand_id,:order_id,:user_id,:size_type,:view)

  end

  def order_params
    params.permit(:user_id,:item_id,:progress)
  end


  def set_item
    @item = Item.find(params[:id])
  end
end

