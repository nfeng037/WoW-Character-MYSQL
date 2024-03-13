class RaceClass < ApplicationRecord
  belongs_to :race
  belongs_to :player_class

  validates :race_id, :player_class_id, presence: true
end
