class Step < ApplicationRecord
  belongs_to :objective, counter_cache: true
end
