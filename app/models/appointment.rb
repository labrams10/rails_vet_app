# frozen_string_literal: true

class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :vet
  validates :date, presence: true
  validates :time, presence: true
end
