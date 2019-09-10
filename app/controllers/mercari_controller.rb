class MercariController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def logout
  end
end
