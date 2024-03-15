class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :post_code, :prefecture_id, :municipalities, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :purchase_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :municipalities
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

end