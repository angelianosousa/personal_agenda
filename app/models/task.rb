class Task < ApplicationRecord
  belongs_to :subject, counter_cache: true
end
