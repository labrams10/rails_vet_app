class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :animal
      t.belongs_to :vet
      t.belongs_to :user
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
