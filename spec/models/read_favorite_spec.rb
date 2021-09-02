require "rails_helper"

RSpec.describe ReadFavorite do
  describe "ReadFavoriteモデルのテスト" do
    context "有効なデータの場合" do
      it "全データ入力で正常に保存されるか" do
        expect(build(:read_favorite)).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "book_read_idが空でエラーを返すこと" do
        read_favorite = build(:read_favorite, book_read_id: "")
        read_favorite.valid?
        expect(read_favorite.errors[:book_read_id]).to be_present
      end

      it "user_idが空でエラーを返すこと" do
        read_favorite = build(:read_favorite, user_id: "")
        read_favorite.valid?
        expect(read_favorite.errors[:user_id]).to be_present
      end
    end
  end
end