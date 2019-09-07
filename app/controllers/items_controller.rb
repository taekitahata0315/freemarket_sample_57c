class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item.update(update_item_params)
  end

  def new
    @item = Item.new
  end

  def destroy
  end

  private
   
  def item_params
    params.require(:item).permit(:name, :postage, :region, :shipping_date, :way, :seller_id, :categorys_id, :price, :state, 
    :description, :votes_item_id, images: []).merge(seller_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :postage, :region, :shipping_date, :way, :seller_id, :categorys_id, :price, :state,
    :description, :votes_item_id, images: []).merge(seller_id: current_user.id)
  end
end