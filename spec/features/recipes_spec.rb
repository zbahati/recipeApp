require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  scenario 'user views the recipes list' do
    user = create_user_and_login # Helper method to create a user and log in
    recipe = create_recipe(user) # Helper method to create a food associated with the user

    visit recipes_path

    expect(page).to have_content('Add recipe')
    expect(page).to have_content(recipe.name)
    expect(page).to have_content('Remove')
  end

  scenario 'user creates a new recipe' do
    create_user_and_login

    visit new_recipe_path

    fill_in 'Name', with: 'New Recipe'
    fill_in 'Preparation time', with: 5
    fill_in 'Cooking time', with: 1
    fill_in 'Description', with: 'This is a sample recipe'
    # Fill in other required fields

    click_button 'Create Recipe'

    expect(page).to have_content('Recipe was successfully created.')
    expect(page).to have_content('New Recipe')
  end

  # Add similar scenarios for other actions (show, edit, update, destroy)

  # Helper method to create a user and log in
  def create_user_and_login
    user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    login_as(user, scope: :user)
    user
  end

  # Helper method to create a food associated with the given user
  def create_recipe(user)
    Recipe.create(
      name: 'New Recipe',
      preparation_time: 5,
      cooking_time: 1,
      description: 'This is a sample recipe',
      user:
    )
  end
end
