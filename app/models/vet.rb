class Vet < ActiveRecord::Base
  has_many :appointments
  has_many :user, through: :appointments
end
