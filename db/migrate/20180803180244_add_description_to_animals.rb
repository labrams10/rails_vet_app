class AddDescriptionToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :description, :string
  end
end
