# db/seeds.rb

# Clear existing data
Food.destroy_all
Recipe.destroy_all
User.destroy_all

# Create users
user1 = User.create(name: 'John Doe', email: 'user1@example.com', password: 'Password')
user2 = User.create(name: 'Jane Smith', email: 'user2@example.com', password: 'Password')

# Create foods
food1 = Food.create(name: 'Ingredient 1', measurementUnit: 'kg', price: 5.99, quantity: 2, user: user1)
food2 = Food.create(name: 'Ingredient 2', measurementUnit: 'units', price: 2.49, quantity: 10, user: user2)

# Create recipes
recipe1 = Recipe.create(name: 'Recipe 1', preparation_time: 3, cooking_time: 1, description: 'Delicious recipe', public: true, user: user1)
recipe2 = Recipe.create(name: 'Recipe 2', preparation_time: 2, cooking_time: 1, description: 'Amazing recipe', public: false, user: user2)

# Associate foods with recipes
RecipeFood.create(quantity: 3, recipe: recipe1, food: food1)
RecipeFood.create(quantity: 2, recipe: recipe1, food: food2)
RecipeFood.create(quantity: 4, recipe: recipe2, food: food1)
RecipeFood.create(quantity: 1, recipe: recipe2, food: food2)
