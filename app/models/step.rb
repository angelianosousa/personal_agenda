class Step < ApplicationRecord
  belongs_to :objective, counter_cache: true

  scope :steps_by_deadline, -> (objectives){
    where(objective: objectives).includes(:objective).order(deadline: :asc)
  }
end
