class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pass

      t.timestamps
    end
  end
  def down
  end
end
