class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :name, :preparation_time, :cooking_time, presence: true
  validates :description, length: { minimum: 10, maximum: 1000 }
  validates :preparation_time, :cooking_time, numericality: { greater_than_or_equal_to: 0 }
end
