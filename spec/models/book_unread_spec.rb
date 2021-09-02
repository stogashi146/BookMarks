require "rails_helper"

RSpec.describe BookUnread do
  describe "BookUnreadモデルのテスト" do
    context "有効なデータの場合" do
      it "全データ入力で正常に保存されるか" do
        expect(build(:book_unread)).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "user_idが空でエラーを返すこと" do
        book_unread = build(:book_unread, user_id: "")
        book_unread.valid?
        expect(book_unread.errors[:user_id]).to be_present
      end

      it "book_idが空でエラーを返すこと" do
        book_unread = build(:book_unread, book_id: "")
        book_unread.valid?
        expect(book_unread.errors[:book_id]).to be_present
      end
    end
  end
end