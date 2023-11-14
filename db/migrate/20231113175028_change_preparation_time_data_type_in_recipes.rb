class ChangePreparationTimeDataTypeInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :preparation_time, :text
    change_column :recipes, :cooking_time, :text
  end
end
