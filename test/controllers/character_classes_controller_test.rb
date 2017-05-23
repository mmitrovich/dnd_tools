require 'test_helper'

class CharacterClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get character_classes_index_url
    assert_response :success
  end

  test "should get show" do
    get character_classes_show_url
    assert_response :success
  end

  test "should get new" do
    get character_classes_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_classes_edit_url
    assert_response :success
  end

end
