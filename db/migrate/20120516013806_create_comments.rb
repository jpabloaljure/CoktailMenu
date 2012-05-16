class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :texto
      t.references :cocktail

      t.timestamps
    end
    add_index :comments, :cocktail_id
  end
end
