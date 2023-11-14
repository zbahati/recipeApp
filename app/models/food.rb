class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
