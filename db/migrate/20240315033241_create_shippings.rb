class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.references :purchase,         null:false, foreign_key: true
      t.string     :post_code,        null:false
      t.integer    :prefecture_id,    null:false
      t.string     :municipalities,   null:false
      t.string     :block,            null:false
      t.string     :building
      t.string     :phone_number,     null:false
      t.timestamps
    end
  end
end
