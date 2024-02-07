class AddColumnsToDiets < ActiveRecord::Migration[7.1]
  def change
    add_column :diets, :ingredients, :string
    add_column :diets, :method, :string
  end
end
