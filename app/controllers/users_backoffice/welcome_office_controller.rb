class UsersBackoffice::WelcomeOfficeController < UsersBackofficeController
  def index
    @step_done = Step.with_check(current_user)
    @step_undone = Step.with_uncheck(current_user)
    @total_steps = Step.total_steps(current_user)
    @steps_done_x_undone = (@step_done / @total_steps)
    @total_objectives = Objective.total_objectives(current_user)
  end
end
