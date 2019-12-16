class UsersController < ApplicationController
  # signup 「新規会員登録」画面

  def signup
  end

  def show
  end

  def finish

  end  
  
  def mypage
  end

  def listing
    @items = Item.where user_id: current_user.id
  end

  def profile
  end 
  def card
    @card = Card.where(user_id: current_user.id).first
    unless @card.blank?
      Payjp.api_key = 'sk_test_853b0c9300ad1412a28612e8'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  def listings
    @items = Item.where(user_id: current_user.id).where(order_id: 0)
  end
  def complete
    @items = Item.where(user_id:current_user.id).where("order_id > ?",0)
  end
  def address
    @shipping = Shipping.new
  end
  
  def address_create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to new_card_path
    else
      render :address
    end
  end


  def logout
  end


  def prefecture
  end  

  private

  def shipping_params
    params.require(:shipping).permit(:user_id,:s_family_name,:s_first_name,:s_kana_family_name,:s_kana_first_name,:address_number,:prefecture_id,:city,:town,:building,:s_tel)
  end  

  

end
