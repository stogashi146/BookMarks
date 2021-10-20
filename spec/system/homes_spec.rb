# frozen_string_literal: true

require "rails_helper"

describe "トップページ", type: :system do
    describe "トップページ機能" do
        context "トップページにアクセスしたとき" do
            before do
                visit root_path
            end
            
            it "アバウトページが表示される" do
                expect(page).to have_content "表紙買いをどこでも"
            end
        end
    end
end