class CreateDiets < ActiveRecord::Migration[7.1]
  def change
    create_table :diets do |t|
      t.string :name
      t.integer :calories
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
