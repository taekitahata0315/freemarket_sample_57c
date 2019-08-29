class SellController < ApplicationController
  def index
    @item = Item.create(params[:name])
  end
end
