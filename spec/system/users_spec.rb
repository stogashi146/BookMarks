require "rails_helper"

describe "ユーザー機能", type: :system do
  describe "詳細表示機能" do
    # let(:book){ create(:book) }
    before do
      @user = create(:user)
      sign_in @user
      visit user_path(@user)
    end

    it "マイページを表示できる" do
      expect(page).to have_content @user.name
    end

    it "プロフィール編集画面に遷移できる" do
      find(".user_edit_btn").click
      expect(page).to have_content "プロフィール編集"
    end
  end

  describe "ユーザー編集機能" do
    before do
      @user = create(:user)
      sign_in @user
      visit edit_user_path(@user)
    end

    it "プロフィール編集画面を表示できる" do
      expect(page).to have_content "プロフィール編集"
    end
    
  end
end
