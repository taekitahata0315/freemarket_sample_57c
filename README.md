## README


## userテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|nickname|string|null:false, unique: true|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|date|null: false|
|comment|text|
|gender|string|
|image|string|

###Association
- has_many :items, dependent: :destroy
- has_many :votes_items, dependent: :destroy
- has_many :votes_item_items, through: :votes, source: :item
- has_many :buyed_item, foreign_key: "buyers_id", class_name: "Item"
- has_many :selling_item, -> {where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_item, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :user_ratings
- has_many :cards
- has_many :item_comments
- has_one :address
- has_many :sns_credentials, dependent: :destroy

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

###Association
- belongs_to :user

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postage|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|
|way|string|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|categorys_id|integer|
|price|integer|null: false|   
|state|string|null: false|
|description|text|
|votes_item_id|integer|foreign_key: true|


###Association
- belongs_to :buyers_id, class_name: 'User'
- belongs_to :seller_id, class_name: 'User'
- belongs_to :category
- has_many :votes_items
- has_many :voted_items, through: :votes, source: :item
- has_many :images, dependent: :destroy
- has_one :buyer
- has_many :item_comments

## votesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, index, foreign_key: true|
|user|references|null: false, index, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :item

## user_ratingテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|comment|text|

###Association
- belongs_to :user

## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false,  foreign_key: true|
|user_id|integer|null: false,  foreign_key: true|
|item_comment|text|
###Association
- belongs_to :user
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string|null: false|

###Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|itme_id|integer|null: fasle, foreign_key: true|

###Association
- belongs_to :item, optional: true

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|user_id|integer|null: fasle, foreign_key: true|

###Association
- belongs_to :user

## sns_credentialテーブル
|Column|Type|Options|
|------|----|-------|
uid|string|
provider|string|
user_id|integer|foreign_key: true|

###Association
- belongs_to :user, optional: true
