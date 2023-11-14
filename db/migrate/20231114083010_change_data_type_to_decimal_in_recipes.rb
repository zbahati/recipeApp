class ChangeDataTypeToDecimalInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :preparation_time, :decimal, using: 'CAST(preparation_time AS decimal)'
    change_column :recipes, :cooking_time, :decimal, using: 'CAST(cooking_time AS decimal)'
  end
end
