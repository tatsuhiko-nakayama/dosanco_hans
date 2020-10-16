require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品購入がうまくいくとき' do
      it '必要な情報がすべて存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingがなくても購入できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが不正値では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('カード情報を入力してください')
      end

      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end

      it 'postal_codeにハイフン(-)が含まれていない場合は購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を正しく入力してください')
      end

      it 'cityが空では購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end

      it 'house_numが空では購入できない' do
        @order_address.house_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end

      it 'phoneが空では購入できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
      end

      it 'phoneにハイフン(-)が含まれている場合は購入できない' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を正しく入力してください')
      end
    end
  end
end
