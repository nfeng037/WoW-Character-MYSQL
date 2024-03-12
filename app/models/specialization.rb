class Specialization < ApplicationRecord
  self.primary_key = 'id'

  belongs_to :player_class
end
