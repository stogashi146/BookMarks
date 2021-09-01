require "rails_helper"

RSpec.describe BookRead do
  describe "BookReadモデルのテスト" do
    context "有効なデータの場合" do
      it "全データ入力で正常に保存されるか" do
        expect(build(:book_read)).to be_valid
      end

      it "rateが空で正常に保存されるか" do
        book_read = build(:book_read, rate: nil)
        expect(book_read).to be_valid
      end

      it "commentが空で正常に保存されるか" do
        book_read = build(:book_read, comment: nil)
        expect(book_read).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "user_idが空でエラーを返すこと" do
        book_read = build(:book_read, user_id: "")
        book_read.valid?
        expect(book_read.errors[:user_id]).to be_present
      end

      it "book_idが空でエラーを返すこと" do
        book_read = build(:book_read, book_id: "")
        book_read.valid?
        expect(book_read.errors[:book_id]).to be_present
      end

      it "rateが文字列でエラーを返すこと" do
        book_read = build(:book_read, rate: "aaa")
        book_read.valid?
        expect(book_read.errors[:rate]).to be_present
      end

      it "rateが少数でエラーを返すこと" do
        book_read = build(:book_read, rate: 1.2)
        book_read.valid?
        expect(book_read.errors[:rate]).to be_present
      end

      it "commentが51文字以上でエラーを返すこと" do
        book_read = build(:book_read, comment: "a" * 51)
        book_read.valid?
        expect(book_read.errors[:comment]).to be_present
      end
    end
  end
end