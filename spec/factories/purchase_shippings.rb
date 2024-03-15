FactoryBot.define do
  factory :purchase_shipping do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    municipalities { '横浜市緑区' }
    block          { '青山1-1-1' }
    building       { '柳ビル103' }
    phone_number   { '09012345678' }
  end
end