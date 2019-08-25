## README


## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null:false, unique: true|
|user_image|string|
|furigana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|address_id|integer|null: false|
|birthday|integer|null: false|
|comment|text|
|gender|string|null: false|
|user_rating_id|integer|
|item_comment|text|
|buyers_id|integer|
|images_id|integer|


###Association
- has_many :items, dependent: :destroy
- has_many :votes_items, dependent: :destroy
- has_many :votes_item_items, through: :votes, source: :item
- has_many :user_ratings
- has_many :cards
- has_many :item_comments
- has_many :items, through: :buyers
- has_one :address
- has_many :itmes, through: :images

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

###Association
- belongs_to :user
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
|seller_id|integer|null: false|
|buyers_id|integer|
|category_id|integer|null: false|
|price|integer|null: false|   
|state||string|null: false|
|description|text|
|votes_item_id|integer|null: false|
|image_id|integer|null: false|

###Association
- belongs_to :user
- belongs_to :item_comment
- belongs_to :category
- has_many :users, through: :buyers
- has_many :votes_items
- has_many :voted_items, through: :votes, source: :item
- has_many :users, through: :images


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
|user_id|references|null: false, foreign_key: true|
|comment|text|

###Association
- belongs_to :user

## item_commentテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false,  foreign_key: true|
|user_id|references|null: false,  foreign_key: true|
###Association
- belongs_to :user
- belongs_to :item

## categoryテーブル
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
|user_id|references|null: false, foreign_key: true|
|itme_id|references|null: fasle, foreign_key: true|

###Association
- belongs_to :item
- belongs_to :user


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|

###Association
- belongs_to :user