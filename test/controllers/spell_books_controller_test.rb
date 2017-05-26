require 'test_helper'

class SpellBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get spell_books_show_url
    assert_response :success
  end

  test "should get new" do
    get spell_books_new_url
    assert_response :success
  end

  test "should get edit" do
    get spell_books_edit_url
    assert_response :success
  end

  test "should get delete" do
    get spell_books_delete_url
    assert_response :success
  end

end
