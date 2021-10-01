require 'rails_helper'

RSpec.describe List, type: :model do
  describe '動作確認のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'Listを追加' do
      user = @user
      list = List.new(
        user_id: 1,
        title: "test",
      )
      expect(list).to be_valid
    end

    it 'Listを削除' do
      user = @user
      List =FactoryBot.create(:list)
      list.destroy
      expect{List.find(1)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it 'Listのtitleを編集' do
      user = @user
      list =FactoryBot.create(:list)
      list.update(title: "new-title")
      expect(list.title).to eq "new-title"
    end
  
  end

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'titleが空の場合保存されない' do
      user = @user
      list = List.new(
        user_id: 1,
        title: "",
      )
      list.valid?
      expect(list.errors[:title]).to include("を入力してください")
    end

    it 'titleが40文字の以上の場合保存されない' do
      user = @user
      list = list.new(
        user_id: 1,
        title: "テストテストテストテストテストテストテストテストテストテスト",
      )
      list.valid?
      expect(list.errors[:title]).to include("は40文字以内で入力してください")
    end
  end

