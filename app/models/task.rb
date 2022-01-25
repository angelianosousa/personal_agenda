class Task < ApplicationRecord
  belongs_to :subject, counter_cache: true

  validates :start_time, :title, presence: true
end
