require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '作品新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '新規登録がうまくいくとき' do
      it 'image,name,info,priceが存在し、category_id,from_id,day_idが2以上であれば登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが¥100~¥9,999,999の間の場合は登録できる' do
        @item.price = 100
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idが「1」の場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'from_idが「1」の場合は登録できない' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('From Select')
      end

      it 'day_idが「1」の場合は登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥100未満では登録できない' do
        @item.price = 99
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが¥10,000,000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceに半角数字以外が含まれている場合は登録できない' do
        @item.price = 1, 0o00
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
