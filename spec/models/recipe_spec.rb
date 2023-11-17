require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with a name, preparation time, cooking time, description' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: 'Ice Cream Sundae', preparation_time: 1, cooking_time: 1, description: 'This is a sample recipe.', user:)
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: '', preparation_time: 1, cooking_time: 1, description: 'This is a sample recipe.', user:)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with no preparation time' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: 'Ice Cream Sundae', cooking_time: 1, description: 'This is a sample recipe.', user:)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with preparation time < 0' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: 'Ice Cream Sundae', preparation_time: -1, cooking_time: 1, description: 'This is a sample recipe.', user:)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with no cooking time' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: 'Ice Cream Sundae', preparation_time: 1, description: 'This is a sample recipe.', user:)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with cooking time < 0' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: 'Ice Cream Sundae', preparation_time: 1, cooking_time: -1, description: 'This is a sample recipe.', user:)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with no description' do
    user = User.create(name: 'Roy Batty')
    recipe = Recipe.new(name: 'Ice Cream Sundae', preparation_time: 1, user:)
    expect(recipe).not_to be_valid
  end
end
