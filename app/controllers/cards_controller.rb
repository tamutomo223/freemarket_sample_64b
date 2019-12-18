class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new
    @card = Card.new
  end  

  def create
    Payjp.api_key = 'sk_test_853b0c9300ad1412a28612e8'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      
      customer = Payjp::Customer.create( 
        card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to finish_users_path
      else
        redirect_to action: "create"
      end
    end
  end

  def add
    
  end  

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = "sk_test_853b0c9300ad1412a28612e8"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to mypage_card_users_path
  end  



  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
