# frozen_string_literal: true

class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :vet
  validates :date, :time, presence: true
end
