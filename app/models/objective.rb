class Objective < ApplicationRecord
  belongs_to :user
  has_many :steps, :dependent => :destroy

  # Kaminari
  paginates_per 10
end
