class PlayerClass < ApplicationRecord
  self.primary_key = 'id'

  has_many :heroes
  has_many :specializations
  has_many :race_classes
  has_many :races, through: :race_classes
end
