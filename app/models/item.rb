class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category

  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :item_category_id
  end  

  with_options presence: true do
    validates :user
    # validates :item_name
    # validates :item_description
    # validates :item_category_id
    # validates :item_condition_id
    # validates :burden_of_shipping_id
    validates :prefecture_id
    validates :delivery_time_id
    # validates :item_price 
  end

end
