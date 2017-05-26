require 'test_helper'

class SpellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spells_index_url
    assert_response :success
  end

  test "should get show" do
    get spells_show_url
    assert_response :success
  end

  test "should get new" do
    get spells_new_url
    assert_response :success
  end

  test "should get edit" do
    get spells_edit_url
    assert_response :success
  end

  test "should get delete" do
    get spells_delete_url
    assert_response :success
  end

end
