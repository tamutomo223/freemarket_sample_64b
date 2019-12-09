require 'rails_helper'
describe User do
  describe "入力存在チェック" do
    it "nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "burthday" do
      user = build(:user, burthday: "")
      user.valid?
      expect(user.errors[:burthday]).to include("can't be blank")
    end

    it "family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    
    it "kana_family_name" do
      user = build(:user, kana_family_name: "")
      user.valid?
      expect(user.errors[:kana_family_name]).to include("can't be blank")
    end

    it "kana_first_name" do
      user = build(:user, kana_first_name: "")
      user.valid?
      expect(user.errors[:kana_first_name]).to include("can't be blank")
    end
  end

  describe "入力文字数チェック" do
    it "password ７文字以上" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "password 128文字以下" do
      # テストデータとして129文字をセット
      user = build(:user, password: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789")
      user.valid?
      expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
    end
  end
end