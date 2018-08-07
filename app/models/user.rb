# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  has_many :animals
  has_many :appointments
  has_many :vets, through: :appointments
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
