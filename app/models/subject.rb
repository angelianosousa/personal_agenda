class Subject < ApplicationRecord
  validates :name, :description, presence: true
  has_many :topics
  accepts_nested_attributes_for :topics, reject_if: :all_blank, allow_destroy: true

  paginates_per 5
end
