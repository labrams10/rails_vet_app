class User < ApplicationRecord
  has_secure_password
  has_many :animals
  has_many :appointments
  has_many :vets, through: :appointments
end
