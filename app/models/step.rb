class Step < ApplicationRecord
  belongs_to :objective, counter_cache: true

  # Kaminari
  paginates_per 10

  scope :steps_by_deadline, -> (objectives){
    where(objective: objectives).includes(:objective).order(deadline: :asc)
  }
end
