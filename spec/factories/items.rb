FactoryBot.define do
  factory :item do
    item_name              { 'test' }
    item_description       { 'test' }
    item_category_id       { 2 }
    item_condition_id      { 2 }
    burden_of_shipping_id  { 2 }
    prefecture_id     { 2 }
    delivery_time_id  { 2 }
    item_price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
