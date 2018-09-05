# frozen_string_literal: true

class Vet < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
end
