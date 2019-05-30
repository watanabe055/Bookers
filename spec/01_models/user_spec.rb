# frozen_string_literal: true

require 'rails_helper'
require "refile/file_double"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Bookモデルを多数持っている" do
      is_expected.to have_many(:books)
    end
  end

  # describe 'バリデーション' do
  #   it "nameが２文字以下だと保存できない" do
  #     is_expected.to validate_length_of(:name).is_at_least(2)
  #   end

  #   it "nameが２0文字以上だと保存できない" do
  #     is_expected.to validate_length_of(:name).is_at_most(20)
  #   end

  #   it "introductionが50文字以上だと保存できない" do 
  #     is_expected.to validate_length_of(:introduction).is_at_most(50)
  #   end
  # end

  describe '実際に保存してみる' do
    context "保存できる場合" do
      it "画像データなし" do
        expect(FactoryBot.create(:user)).to be_valid
      end

      it "画像データあり" do
        expect(FactoryBot.create(:user, :create_with_image)).to be_valid
      end
    end
    context "保存できない場合" do
      it "nameが空欄" do
        expect(FactoryBot.build(:user, :no_name)).to_not be_valid
      end

      it "nameが１文以下" do
        expect(FactoryBot.build(:user, :too_short_name)).to_not be_valid
      end

      it "nameが21文字以上" do
        expect(FactoryBot.build(:user, :too_long_name)).to_not be_valid
      end

      it "introductionが51文字以上" do
        expect(FactoryBot.build(:user, :too_long_introduction)).to_not be_valid
      end
    end
  end
end
