require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  scenario 'user views the food list' do
    user = create_user_and_login # Helper method to create a user and log in
    food = create_food(user) # Helper method to create a food associated with the user

    visit foods_path

    expect(page).to have_content('Food List')
    expect(page).to have_content(food.name)
    expect(page).to have_content(number_to_currency(food.price))
  end

  scenario 'user creates a new food' do
    create_user_and_login

    visit new_food_path

    fill_in 'Name', with: 'New Food'
    fill_in 'Price', with: 5
    fill_in 'Quantity', with: 1
    # Fill in other required fields

    click_button 'Create Food'

    expect(page).to have_content('Food was successfully created.')
    expect(page).to have_content('New Food')
  end

  # Add similar scenarios for other actions (show, edit, update, destroy)

  # Helper method to create a user and log in
  def create_user_and_login
    user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    login_as(user, scope: :user)
    user
  end

  # Helper method to create a food associated with the given user
  def create_food(user)
    Food.create(
      name: 'Test Food',
      measurementUnit: 'unit',
      price: 10.99,
      quantity: 1,
      user:
    )
  end
end
