require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメント投稿がうまくいくとき' do
      it 'messageが存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'messageが空では投稿できない' do
        @comment.message = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Message can't be blank")
      end

      it 'messageが140文字以内でなければ投稿できない' do
        @comment.message = Faker::Lorem.characters(141)
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Message is too long (maximum is 140 characters)")
      end
    end

  end
end
