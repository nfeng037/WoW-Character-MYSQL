class Specialization < ApplicationRecord
  self.primary_key = 'id'

  belongs_to :player_class

  validates :id, :name, :description, :role, :player_class_id, presence: true
end
