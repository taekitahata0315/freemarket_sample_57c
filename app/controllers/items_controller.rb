class ItemsController < ApplicationController

  before_action :authenticate_user!

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.seller_id != current_user.id
    redirect_to root_path
    end 
  end

  def update
    @item = Item.find(params[:id])  
    @item.update(update_item_params)
    redirect_to item_path(@item.id)
  end

  def new
    @item = Item.new
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.seller_id == current_user.id
    redirect_to root_path
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