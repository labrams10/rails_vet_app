class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.belongs_to :user
      t.string :name
      t.integer :weight
      t.string :breed
      t.string :species

      t.timestamps
    end
  end
end
