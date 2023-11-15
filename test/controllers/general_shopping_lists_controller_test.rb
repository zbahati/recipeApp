require "test_helper"

class GeneralShoppingListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_shopping_list = general_shopping_lists(:one)
  end

  test "should get index" do
    get general_shopping_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_general_shopping_list_url
    assert_response :success
  end

  test "should create general_shopping_list" do
    assert_difference("GeneralShoppingList.count") do
      post general_shopping_lists_url, params: { general_shopping_list: { index: @general_shopping_list.index } }
    end

    assert_redirected_to general_shopping_list_url(GeneralShoppingList.last)
  end

  test "should show general_shopping_list" do
    get general_shopping_list_url(@general_shopping_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_shopping_list_url(@general_shopping_list)
    assert_response :success
  end

  test "should update general_shopping_list" do
    patch general_shopping_list_url(@general_shopping_list), params: { general_shopping_list: { index: @general_shopping_list.index } }
    assert_redirected_to general_shopping_list_url(@general_shopping_list)
  end

  test "should destroy general_shopping_list" do
    assert_difference("GeneralShoppingList.count", -1) do
      delete general_shopping_list_url(@general_shopping_list)
    end

    assert_redirected_to general_shopping_lists_url
  end
end
