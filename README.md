## README


## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null:false, unique: true|
|furigana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|integer|null: false|
|comment|text|
|gender|string|null: false|
|image|string|

###Association
- has_many :items, dependent: :destroy
- has_many :votes_items, dependent: :destroy
- has_many :votes_item_items, through: :votes, source: :item
- has_many :user_ratings
- has_many :cards
- has_many :item_comments
- has_one :address

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :item

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
|region|string|null:|false|
|shipping_date|string|null: false|
|way|string|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyers_id|integer|foreign_key: true|
|categorys_id|integer|null: false|
|price|integer|null: false|   
|state||string|null: false|
|description|text|
|votes_item_id|integer|foreign_key: true|
|image_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :category
- has_many :votes_items
- has_many :voted_items, through: :votes, source: :item
- has_many :image
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
|item_id|integer|null: false|
|size|string|null: false|

###Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|itme_id|integer|null: fasle, foreign_key: true|

###Association
- belongs_to :item

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