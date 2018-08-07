# frozen_string_literal: true

class Animal < ActiveRecord::Base
  belongs_to :user
  validates :name, :weight, :breed, :age, presence: true

  def self.users_animals(user)
    where(user: user)
  end
end
