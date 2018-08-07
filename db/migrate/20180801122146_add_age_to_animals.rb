# frozen_string_literal: true

class AddAgeToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :age, :integer
  end
end
