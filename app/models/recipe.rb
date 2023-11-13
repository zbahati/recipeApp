class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, :preparation_time, :cooking_time, presence: true

  #custom validations
  validate :validate_time_format

  private

  def validate_time_format
    validate_time_format_for(:preparation_time)
    validate_time_format_for(:cooking_time)
  end

  def validate_time_format_for(added_time)
    value = send(added_time)
    return if value.blank?
    unless value.match?(/\A\d+(\.\d+)? (hours|minutes)\z/i)
      errors.add(added_time, "should be number + hours(if many) or hour(if one) or munites")
    end
  end
end
