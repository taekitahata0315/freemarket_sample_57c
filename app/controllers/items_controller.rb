class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      image_id = image.find(@item.id).id
      item = Item.find(@item.id) 
      item.update(image_id: image_id)
      redirect_to root_path
    else
      redirect_to new_user_item_path
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
    @item.images.build 
  end

  def destroy
  end

  private
   
  def item_params
    params.require(:item).permit(:name, :posgate, :region, :shipping_date, :way, :seller_id, :buyer_id, :categorys_id, :price, :state, 
    :description, :votes_item_id, images_attributes: [:string], images:[]).merge(seller_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :posgate, :region, :shipping_date, :way, :seller_id, :buyer_id, :categorys_id, :price, :state,
    :description, :votes_item_id, images_attributes: [:string, :_destroy, :id], images:[]).merge(seller_id: current_user.id)

end
