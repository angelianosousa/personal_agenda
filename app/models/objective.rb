class Objective < ApplicationRecord
  belongs_to :user
  has_many :steps, :dependent => :destroy

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  # Kaminari
  paginates_per 10

  scope :total_objectives, -> (current_user){ where(user: current_user).includes(:step).size }
end
