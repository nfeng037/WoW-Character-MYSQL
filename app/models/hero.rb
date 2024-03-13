class Hero < ApplicationRecord
  belongs_to :race
  belongs_to :player_class

  validates :name, :quote, :race_id, :player_class_id, presence: true
end
