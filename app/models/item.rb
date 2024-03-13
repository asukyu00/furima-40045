class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_of_shipping, class_name: 'BurdenOfShipping', foreign_key: 'burden_of_shipping_id'
  belongs_to :shipping_date
  has_one_attached :image

  belongs_to :user

  validates :item_price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :item_category_id
    validates :item_condition_id
    validates :burden_of_shipping_id
    validates :delivery_time_id
  end  

  with_options presence: true do
    validates :user
    validates :item_name
    validates :item_description
    validates :item_category_id
    validates :item_condition_id
    validates :burden_of_shipping_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :item_price
    validates :image
  end

end
