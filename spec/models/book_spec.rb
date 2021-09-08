require "rails_helper"

RSpec.describe Book do
  describe "Bookモデルのテスト" do

    context "有効なデータの場合" do
      it "正常に保存されるか" do
        expect(build(:book)).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "isbnが空でエラーを返すこと" do
        book = build(:book, isbn:"")
        book.valid?
        expect(book.errors[:isbn]).to be_present
      end
    end
  end
end