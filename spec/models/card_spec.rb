require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'カード登録' do
    before do
      @card = FactoryBot.build(:card)
    end

    context 'カード登録がうまくいくとき' do
      it 'card_token,customer_tokenが存在すれば登録できる' do
        expect(@card).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'card_tokenが空では登録できない' do
        @card.card_token = nil
        @card.valid?
        expect(@card.errors.full_messages).to include('Card tokenを入力してください')
      end

      it 'customer_tokenが空では登録できない' do
        @card.customer_token = nil
        @card.valid?
        expect(@card.errors.full_messages).to include('Customer tokenを入力してください')
      end
    end
  end
end
