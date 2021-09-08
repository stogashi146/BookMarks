require "rails_helper"

RSpec.describe Notification do
  describe "Notificationモデルのテスト" do
    context "有効なデータの場合" do
      it "action=readで正常に保存されるか" do
        notification = build(:notification, action: "read")
        expect(notification).to be_valid
      end

      it "action=releaseで正常に保存されるか" do
        notification = build(:notification, action: "release")
        expect(notification).to be_valid
      end

      it "action=commentで正常に保存されるか" do
        notification = build(:notification, action: "comment")
        expect(notification).to be_valid
      end

      it "action=favoriteで正常に保存されるか" do
        notification = build(:notification, action: "favorite")
        expect(notification).to be_valid
      end

      it "action=followで正常に保存されるか" do
        notification = build(:notification, action: "follow")
        expect(notification).to be_valid
      end
    end

    context "無効なデータの場合" do
      it "visitor_idが空でエラーを返すこと" do
        notification = build(:notification, visitor_id: "")
        notification.valid?
        expect(notification.errors[:visitor_id]).to be_present
      end

      it "visited_idが空でエラーを返すこと" do
        notification = build(:notification, visited_id: "")
        notification.valid?
        expect(notification.errors[:visited_id]).to be_present
      end

      it "actionが空でエラーを返すこと" do
        notification = build(:notification, action: "")
        notification.valid?
        expect(notification.errors[:action]).to be_present
      end
    end
  end
end