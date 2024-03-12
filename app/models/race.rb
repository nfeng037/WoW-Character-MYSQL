class Race < ApplicationRecord
  self.primary_key = 'id'

  has_many :heros
  has_many :race_classes
  has_many :classes, through: :race_classes

end
