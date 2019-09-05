class Item < ApplicationRecord
belongs_to :buyers_id, class_name: 'User'
belongs_to :seller_id, class_name: 'User'
belongs_to :category
has_many :votes_items
has_many :voted_items, through: :votes, source: :item
has_many :images, dependent: :destroy
has_one :buyer
has_many :item_comments
accepts_nested_attributes_for :images

end
