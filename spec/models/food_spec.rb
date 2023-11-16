require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name, price and quantity >= 0' do
    user = User.create(name: 'Roy Batty')
    food = Food.new(name: 'Gelatto', quantity: 5, user:, price: 25)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'Roy Batty')
    food = Food.new(name: '', quantity: 5, user:, price: 25)
    expect(food).not_to be_valid
  end

  it 'is not valid with a negative quantity' do
    user = User.create(name: 'Roy Batty')
    food = Food.new(name: 'Gelatto', quantity: -5, user:, price: 25)
    expect(food).not_to be_valid
  end

  it 'is not valid with a negative price' do
    user = User.create(name: 'Roy Batty')
    food = Food.new(name: 'Gelatto', quantity: 5, user:, price: -25)
    expect(food).not_to be_valid
  end
end
