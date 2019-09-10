class MercariController < ApplicationController

  before_action :authenticate_user!, except: :index

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
