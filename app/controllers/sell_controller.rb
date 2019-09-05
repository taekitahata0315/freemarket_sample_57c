class SellController < ApplicationController
  def index
  end
  
  def create
    @item = Item.new(group_params)
    if @item.save
      redirect_to root_path
    end
  end

  def buy
  end

  def comfirm
  end

  def show
  end
end
