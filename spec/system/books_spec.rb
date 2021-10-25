require "rails_helper"

describe "本機能", type: :system do
  describe "一覧表示機能" do
    before do
      visit root_path
      click_on "本を探す"
    end

    context "未ログインのとき" do
      it "本を探すボタンから遷移される" do
        expect(page).to have_content "本の一覧"
      end

      it "ジャンルで一覧検索できる" do
        click_on "少年"
        expect(page).to have_content "本の一覧"
      end
    end

    context "ログイン済みのとき" do
      it "本を探すボタンから遷移される" do
        expect(page).to have_content "本の一覧"
      end

      it "ジャンル検索で一覧表示される" do
        click_on "少年"
        expect(page).to have_content "本の一覧"
      end
    end
  end

  describe "詳細表示機能" do
    let(:book){ create(:book) }

    before do
      visit book_path(book.id)
    end

    context "未ログインのとき" do
      it "本の詳細が表示される" do
        expect(page).to have_content book.title
      end

      it "著者で一覧検索できる" do
        click_on book.author
        expect(page).to have_content "「#{book.author.gsub(" ", "")}」の一覧"
      end

      it "出版社で一覧検索できる" do
        click_on book.publisher_name
        expect(page).to have_content "「#{book.publisher_name}」の一覧"
      end

      it "読んだリストに追加できない" do
        find(".read_btn").click
        expect(page).to have_content "ログイン"
      end

      it "読みたいリストに追加できない" do
        find(".unread_btn").click
        expect(page).to have_content "ログイン"
      end
    end

    context "ログイン済みのとき" do
      before do
        user = create(:user)
        sign_in user
        visit book_path(book.id)
      end

      it "著者で一覧を表示できる" do
        click_on book.author
        expect(page).to have_content "「#{book.author.gsub(" ", "")}」の一覧"
      end

      it "出版社で一覧を表示できる" do
        click_on book.publisher_name
        expect(page).to have_content "「#{book.publisher_name}」の一覧"
      end

      it "読んだリストに追加できる" do
        fill_in "book_read[comment]", with: "読みました"
        # find('#star').find("img[alt=4]").click
        fill_in "book_read[tag_list]", with: "鬼滅,煉獄"
        click_button "投稿する"
        expect(page).to have_selector ".alert-success", text: "レビューの投稿に成功しました"
      end

      it "読みたいリストに追加できる" do
        find(".unread_btn").click
        expect(page).to have_content "読みたいリストに追加しました"
      end
    end


  end
end
