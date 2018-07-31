class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :vet
end
