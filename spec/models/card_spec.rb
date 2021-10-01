require 'rails_helper'

RSpec.describe CARD, type: :model do
  describe '動作確認のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'Cardを追加' do
      user = @user
      card = Card.new(
        user_id: 1,
        title: "test",
      )
      expect(card).to be_valid
    end

    it 'Cardを削除' do
      user = @user
      card =FactoryBot.create(:card)
      card.destroy
      expect{Card.find(1)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it 'Cardのtitleを編集' do
      user = @user
      card =FactoryBot.create(:card)
      card.update(title: "new-title")
      expect(card.title).to eq "new-title"
    end
  
  end

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'titleが空の場合保存されない' do
      user = @user
      card = Card.new(
        user_id: 1,
        title: "",
      )
      card.valid?
      expect(card.errors[:title]).to include("を入力してください")
    end

    it 'titleが20文字の以上の場合保存されない' do
      user = @user
      card = Card.new(
        user_id: 1,
        title: "テストテストテストテストテストテストテストテストテストテスト",
      )
      card.valid?
      expect(card.errors[:title]).to include("は20文字以内で入力してください")
    end
  end
