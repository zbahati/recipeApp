# spec/features/shopping_lists_spec.rb

require 'rails_helper'

RSpec.feature 'Shopping Lists', type: :feature do
  let(:user) { create_user_and_login }

  scenario 'user views the general shopping list' do
    # Create some example foods and recipe foods for the user
    food1 = create_food(user, name: 'Food 1', quantity: 10, price: 1.99)
    food2 = create_food(user, name: 'Food 2', quantity: 5, price: 2.49)

    # Save the recipes before creating associated recipe_foods
    recipe1 = create_recipe(user, name: 'Recipe 1')
    create_recipe_food(user, recipe1, food1, quantity: 15)

    recipe2 = create_recipe(user, name: 'Recipe 2')
    create_recipe_food(user, recipe2, food2, quantity: 13)

    visit general_shopping_list_index_path

    # Add expectations based on your view content
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Amount of food items to buy:')
    expect(page).to have_content('Total value of food needed:')

    # Add more expectations based on the content of your table
    # expect(page).to have_content('Food 1')
    # expect(page).to have_content('Food 2')

    # Ensure the total quantity and total price calculations are correct
    # expect(page).to have_content('Quantity', text: '8') # Adjust based on your data
    # expect(page).to have_content('Price per unit', text: '1.99') # Adjust based on your data
    # expect(page).to have_content('Total Price', text: '15.92') # Adjust based on your data
  end

  # Helper methods for creating objects in the database
  def create_user_and_login
    user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    login_as(user, scope: :user)
    user
  end

  def create_food(user, attributes = {})
    user.foods.create(attributes)
  end

  def create_recipe(user, attributes = {})
    user.recipes.create(attributes)
  end

  def create_recipe_food(user, recipe, food, attributes = {})
    # Create RecipeFood if the Recipe is saved successfully
    if recipe.save
      recipe_food = recipe.recipe_foods.new(food: food, quantity: attributes[:quantity])

      # Save the RecipeFood if it's valid
      if recipe_food.valid?
        recipe_food.save
        recipe_food
      else
        nil
      end
    else
      nil
    end
  end
end
