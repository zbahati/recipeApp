require 'application_system_test_case'

class GeneralShoppingListsTest < ApplicationSystemTestCase
  setup do
    @general_shopping_list = general_shopping_lists(:one)
  end

  test 'visiting the index' do
    visit general_shopping_lists_url
    assert_selector 'h1', text: 'General shopping lists'
  end

  test 'should create general shopping list' do
    visit general_shopping_lists_url
    click_on 'New general shopping list'

    fill_in 'Index', with: @general_shopping_list.index
    click_on 'Create General shopping list'

    assert_text 'General shopping list was successfully created'
    click_on 'Back'
  end

  test 'should update General shopping list' do
    visit general_shopping_list_url(@general_shopping_list)
    click_on 'Edit this general shopping list', match: :first

    fill_in 'Index', with: @general_shopping_list.index
    click_on 'Update General shopping list'

    assert_text 'General shopping list was successfully updated'
    click_on 'Back'
  end

  test 'should destroy General shopping list' do
    visit general_shopping_list_url(@general_shopping_list)
    click_on 'Destroy this general shopping list', match: :first

    assert_text 'General shopping list was successfully destroyed'
  end
end
