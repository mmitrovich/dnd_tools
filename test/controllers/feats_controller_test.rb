require 'test_helper'

class FeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feats_index_url
    assert_response :success
  end

  test "should get show" do
    get feats_show_url
    assert_response :success
  end

  test "should get new" do
    get feats_new_url
    assert_response :success
  end

  test "should get edit" do
    get feats_edit_url
    assert_response :success
  end

end
