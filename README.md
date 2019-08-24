# README


## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null:false, unique: true|
|furigana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|address|string|null: false|
|birthday|integer|null: false|
|comment|text|
|gender|string|null: false|
|user_evaluation_id|integer|
|discount_comment|text|

###Association
- has_many :items, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_items, through: :likes, source: :item
- has_many :user_evalutions
- has_many :cards
- has_many :discount_comments

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
|image|string|null: false|
|postage|string|null: false|
|region|string|null:|false|
|shipping_date|string|null: false|
|way|string|null: false|
|user_sell_id|integer|null: false|
|user_buy_id|integer|
|category_id|integer|null: false|
|price|integer|null: false|   
|state||string|null: false|
|description|text|
|like_id|integer|null: false|

###Association
- belongs_to :user
- has_many :likes
- has_many :liked_items, through: :likes, source: :item
- belongs_to :discount_comment
- belongs_to :category

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, index, foreign_key: true|
|user|references|null: false, index, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :item


## user_ evaluationテーブル(ユーザー評価)
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|comment|text|

###Association
- belongs_to :user

## discount_commentテーブル
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
- has_one :item