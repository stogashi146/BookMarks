require "rails_helper"

RSpec.describe Relationship do
  describe "Relationshipモデルのテスト" do
    context "有効なデータの場合" do
      it "全データ入力で正常に保存されるか" do
        expect(build(:relationship)).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "全データが空でエラーを返すこと" do
        relationship = build(:relationship, follower_id: "", followed_id: "")
        relationship.valid?
        expect(relationship.errors).to be_present
      end

      it "follower_idが空でエラーを返すこと" do
        relationship = build(:relationship, follower_id: "")
        relationship.valid?
        expect(relationship.errors[:follower_id]).to be_present
      end

      it "followed_idが空でエラーを返すこと" do
        relationship = build(:relationship, followed_id: "")
        relationship.valid?
        expect(relationship.errors[:followed_id]).to be_present
      end
    end
  end
end