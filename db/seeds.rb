# Users
User.create(name: 'user1')
User.create(name: 'user2')

# Foods
Food.create(name: 'Food 1', measurementUnit: 'grams', price: 10.99, quantity: 500, user_id: 1)
Food.create(name: 'Food 2', measurementUnit: 'pieces', price: 2.5, quantity: 10, user_id: 2)
Food.create(name: 'Food 3', measurementUnit: 'pieces', price: 25, quantity: 1, user_id: 2)
Food.create(name: 'Food 4', measurementUnit: 'liters', price: 7.0, quantity: 5, user_id: 2)
