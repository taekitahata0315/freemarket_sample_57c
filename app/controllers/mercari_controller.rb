class MercariController < ApplicationController

  def index
    @items = Item.where(buyer_id: nil)
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(buyer_id: nil)
  end

  def logout
  end
end
