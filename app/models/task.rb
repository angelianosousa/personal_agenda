class Task < ApplicationRecord
  belongs_to :board, counter_cache: true

  validates :start_time, presence: true
end
