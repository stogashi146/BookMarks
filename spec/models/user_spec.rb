require "rails_helper"

RSpec.describe User do
  describe "Userモデルのテスト" do

    context "有効なデータの場合" do
      it "正常に保存されるか" do
        expect(build(:user)).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "emailが空でエラーを返すこと" do
        user = build(:user, email:"")
        user.valid?
        expect(user.errors[:email]).to be_present
      end

      it "passwordが6文字未満でエラーを返すこと" do
        user = build(:user, password:"a" * 5)
        # @user.password = "a" * 5
        user.valid?
        expect(user.errors[:password]).to be_present
      end

      it "passwordが129文字以上でエラーを返すこと" do
        user = build(:user, password:"a" * 129)
        user.valid?
        expect(user.errors[:password]).to be_present
      end

      it "passwordが不一致でエラーを返すこと" do
        user = build(:user, password:"hoge", password_confirmation:"hogehoge")
        user.valid?
        expect(user.errors[:password_confirmation]).to be_present
      end

      it "introductionが51文字以上でエラーを返すこと" do
        user = build(:user, introduction:"a" * 51)
        user.valid?
        expect(user.errors[:introduction]).to be_present
      end
    end
  end
end
