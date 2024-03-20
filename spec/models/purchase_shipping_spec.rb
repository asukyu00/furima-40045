require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'tokenが空では保存できない' do
        @purchase_shipping.token = ' '
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できない' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @purchase_shipping.prefecture_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @purchase_shipping.municipalities = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'blockが空では保存できない' do
        @purchase_shipping.block = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeはハイフンがないと保存できない' do
        @purchase_shipping.post_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは半角英数混合では保存できない' do
        @purchase_shipping.post_code = '123-abcd'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは全角では保存できない' do
        @purchase_shipping.post_code = '１２３-４５６７'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idは選択していないと保存できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'phone_numberは9桁以下の数字では保存できない' do
        @purchase_shipping.phone_number = '090123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12桁以上の数字では保存できない' do
        @purchase_shipping.phone_number = '090123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは半角英数混合では保存できない' do
        @purchase_shipping.phone_number = 'abc123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは全角では保存できない' do
        @purchase_shipping.phone_number = '０９０１２３４５６７８'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_id（購入者）が空だと保存できない' do
        @purchase_shipping.user_id = ' '
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと保存できない' do
        @purchase_shipping.item_id = ' '
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
