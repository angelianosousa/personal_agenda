class Subject < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  paginates_per 10
end
