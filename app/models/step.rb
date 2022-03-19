class Step < ApplicationRecord
  belongs_to :objective, counter_cache: true
  belongs_to :user

  # Kaminari
  paginates_per 10

  scope :steps_by_deadline, -> (objectives){
    where(objective: objectives).includes(:objective).order(deadline: :asc)
  }

  scope :with_check, ->(current_user) { where(user: current_user, done: true).includes(:objective).size }
  scope :with_uncheck, ->(current_user) { where(user: current_user, done: false).includes(:objective).size }
  scope :total_steps, ->(current_user) { where(user: current_user).includes(:objective).size }

end
