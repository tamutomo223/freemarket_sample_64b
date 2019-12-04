# Freemarket_sample_64bDB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|mail|string|null: false,unique: true|
|password|string|null: false|
|burthday|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|kana_family_name|string|null: false|
|kana_first_name|string|null: false|
|tel|string|null: false|
|profile|text||
|icon|string||
|money|integer||
|point|integer||
### Association
- has_many :orders
- has_many :items
- has_many :item_comments
- has_many :likes
- has_many :user_reviews
- has_one :shipping
  
## shippingsテーブル  
|Column|Type|Options|
|------|----|-------|
|address_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|town|string|null: false|
|house_number|string|null: false|
|building|string|null: false|
|user_id|references|null: false, foreign_key: true|
|s_first_same|string|null: false|
|s_family_same|string|null: false|
|s_kana_family_same|string|null: false|
|s_kana_first_same|string|null: false|
|s_tel|string||
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|seller|string|null: false|
|order_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|explain|string|null: false|
|status|string|null: false|
|fee|string|null: false|
|s_prefecture|string|null: false|
|s_date|integer|null: false|
|price|integer|null: false|
|view|integer||
|size|string|null: false|
|size_type|string||
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
### Association
- belongs_to :order
- belongs_to :user
- has_many :images
- belongs_to :category
- belongs_to :brand
- has_many :item_comments
  
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|Ancestry|text|null: false|
|item_id|references|foreign_key: true, null: false|
### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|
|brand_group_id|integr||
|item_id|references|foreign_key: true, null: false|
### Association
- belongs_to :brand_group
- has_many :items

  
## brand_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
|brand_id|references|foreign_key: true|
### Association
- has_many :brands


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image_url|text|null: false|
### Association
- belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|foreign_key: true|
|b_day|string|null: false|
|progress|integer||
|service|string||
|pay|string||
### Association
- belongs_to :item
- belongs_to :user
- has_many :messages

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|order_id|references|foreign_key: true|
### Association
- belongs_to :order

## user_reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|review_id|integer|null: false|
|review|string|null: false|
|r_comment|text||
### Association
- belongs_to :user

## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|items_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item