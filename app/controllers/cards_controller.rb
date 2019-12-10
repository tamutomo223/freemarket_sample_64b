class CardsController < ApplicationController
  def new
    @card = Card.new
  end  
end
