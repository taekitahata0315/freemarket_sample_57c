class PurchaseController < ApplicationController
  require 'payjp'
  def index
    card = Card.where(user_id:current_user.id).first
    if card.blank?
      redirect_to controller:"card",action:"new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def done
  end

  def pay
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if @item.seller_id == current_user.id
      redirect_to root_path
    else
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount:@item.price,
    customer: card.customer_id,
    currency: 'jpy',
  )
  @item.update(buyer_id: current_user.id)
  redirect_to '/mercari'
    end
  end
end
