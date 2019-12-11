class UsersController < ApplicationController
  # signup 「新規会員登録」画面

  def signup
  end

  def show
  end
  
  def mypage
  end

  def profile
  end 
  def card
  end
  def address
    @shipping = Shipping.new
  end
  
  def address_create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to root_path
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
