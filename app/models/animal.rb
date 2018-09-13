# frozen_string_literal: true

class Animal < ActiveRecord::Base
  has_many :foodbrands
  belongs_to :user

  validates :name, presence: true
  validates :weight, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  scope :users_animals, ->(user) { where(user: user) }
end
