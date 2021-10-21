# frozen_string_literal: true

require "rails_helper"

describe "トップページ", type: :system do
    describe "トップページ機能" do
        context "トップページにアクセスしたとき" do
            before do
                visit root_path
            end

            it "アバウトページが表示される" do
                expect(page).to have_content "表紙買いを\nどこでも"
            end
        end
    end

    describe "ヘッダー機能" do
      context "未ログインのとき" do
        before do
          visit root_path
        end

        it "検索フォームで検索できる" do
          fill_in "keyword", with: "鬼滅の刃"
          click_button "検索"
          expect(page).to have_content "「鬼滅の刃」の検索結果"
        end

        it "未ログインメニューが表示される" do
          expect(page).to have_content "本を探す About ランキング ログイン 新規登録"
        end
      end

      context "ログイン済みのとき" do
        before do
          user = create(:user)
          sign_in user
          visit root_path
        end

        it "検索フォームで検索できる" do
          fill_in "keyword", with: "鬼滅の刃"
          click_button "検索"
          expect(page).to have_content "「鬼滅の刃」の検索結果"
        end

        it "ログイン済みメニューが表示される" do
          expect(page).to have_content "本を探す マイページタイムライン ランキング 発売カレンダー"
        end

      end
    end
end
