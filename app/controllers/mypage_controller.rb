class MypageController < ApplicationController
  def index
  end

  def card
  end

  def info
  end

  def profile
  end

  def list
    @items = Item.all
  end

end
