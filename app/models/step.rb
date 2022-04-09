class Step < ApplicationRecord
  belongs_to :objective, counter_cache: true
  belongs_to :user

  # Kaminari
  # paginates_per 10

  scope :steps_by_deadline, ->(objectives){
    where(objective: objectives).includes(:objective).order(deadline: :asc)
  }

  scope :with_check, ->(current_user) { where(user: current_user, done: true).includes(:objective).size.to_f.round(2) }
  scope :with_uncheck, ->(current_user) { where(user: current_user, done: false).includes(:objective).size.to_f.round(2) }
  scope :total_steps, ->(current_user) { where(user: current_user).includes(:objective).size.to_f.round(2) }
  # scope :steps_done_x_undone, ->(current_user) { Step.with_uncheck(current_user) / Step.total_steps(current_user) }

  scope :index_scope, ->(current_user, page, count_objects) {
    @steps_object_per_deadlines = {}
    all_steps = Step.where(user: current_user).includes(:objective).order(deadline: :asc)
    steps_for_current_user = all_steps.pluck(:deadline)

    # Adding every step object on your respectivelly week
    steps_for_current_user.each do |line|
      beginning = line.beginning_of_week.strftime('%d/%m') # Get the beggining of week for every deadline
      ending = line.end_of_week.strftime('%d/%m') # Get the ending of week for every deadline
      @steps_object_per_deadlines["Week #{beginning} - #{ending}"] = all_steps.select { |step| step.deadline.beginning_of_week == line.beginning_of_week }
    end
    Kaminari.paginate_array(@steps_object_per_deadlines.to_a).page(page).per(count_objects)
  }
end
