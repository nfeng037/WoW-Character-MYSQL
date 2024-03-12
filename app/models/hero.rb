class Hero < ApplicationRecord
  belongs_to :race
  belongs_to :player_class
end
