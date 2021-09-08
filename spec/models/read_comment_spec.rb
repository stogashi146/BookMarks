require "rails_helper"

RSpec.describe ReadComment do
  describe "ReadCommentモデルのテスト" do
    context "有効なデータの場合" do
      it "全データ入力で正常に保存されるか" do
        expect(build(:read_comment)).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "book_read_idが空でエラーを返すこと" do
        read_comment = build(:read_comment, book_read_id: "")
        read_comment.valid?
        expect(read_comment.errors[:book_read_id]).to be_present
      end

      it "user_idが空でエラーを返すこと" do
        read_comment = build(:read_comment, user_id: "")
        read_comment.valid?
        expect(read_comment.errors[:user_id]).to be_present
      end

      it "commentが空でエラーを返すこと" do
        read_comment = build(:read_comment, comment: "")
        read_comment.valid?
        expect(read_comment.errors[:comment]).to be_present
      end

      it "commentが51文字以上でエラーを返すこと" do
        read_comment = build(:read_comment, comment: "a" * 51)
        read_comment.valid?
        expect(read_comment.errors[:comment]).to be_present
      end
    end
  end
end