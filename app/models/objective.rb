class Objective < ApplicationRecord
  belongs_to :user
  has_many :steps, :dependent => :destroy

  # Kaminari
  paginates_per 10

  scope :total_objectives, -> (current_user){ where(user: current_user).size }
end
