class Race < ApplicationRecord
  self.primary_key = 'id'

  has_many :heroes
  has_many :race_classes
  has_many :player_classes, through: :race_classes

  validates :name, :faction, :id, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
