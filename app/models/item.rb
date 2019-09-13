class Item < ApplicationRecord
  belongs_to :buyer, class_name: 'User', optional: true
  belongs_to :seller, class_name: 'User'
  belongs_to :category, optional: true
  has_many :votes_items
  has_many :voted_items, through: :votes, source: :item
  has_many_attached :images
  
  validates :images, presence: true, length: {maximum: 10}


  def previous
    Item.order('created_at desc').where("created_at < ?", created_at).first
  end

  def next
    Item.order('created_at desc').where('created_at > ? ', created_at).reverse.first
  end

end