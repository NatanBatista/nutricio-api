class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :table
      t.string :scientific_name
      t.string :code

      t.timestamps
    end
  end
end
