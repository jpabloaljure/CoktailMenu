class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.integer :prise
      t.text :description
      t.integer :grade
      t.boolean :oficial

      t.timestamps
    end
  end
end
