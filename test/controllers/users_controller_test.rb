require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get read" do
    get users_read_url
    assert_response :success
  end

  test "should get unread" do
    get users_unread_url
    assert_response :success
  end

  test "should get follows" do
    get users_follows_url
    assert_response :success
  end

  test "should get followers" do
    get users_followers_url
    assert_response :success
  end

  test "should get welcome" do
    get users_welcome_url
    assert_response :success
  end

  test "should get cancel" do
    get users_cancel_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get users_unsubscribe_url
    assert_response :success
  end

end
