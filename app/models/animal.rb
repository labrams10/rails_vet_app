# frozen_string_literal: true

class Animal < ActiveRecord::Base
  belongs_to :user
  validates :name, :weight, :breed, :age, presence: true
  scope :users_animals, ->(user) { where(user: user) }

  # def self.users_animals(user)
  #   where(user: user)
  # end

  # NOTE: this is a different way to execute the
  # same functionality around using scope

  # scope :users_animals, -> { where(user: user) }
end
