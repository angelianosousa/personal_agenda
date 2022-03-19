class UsersBackoffice::WelcomeController < UsersBackofficeController
  def index
    @step_done = Step.with_check(current_user)
    @step_undone = Step.with_uncheck(current_user)

    @total_objectives = Objective.total_objectives(current_user)
  end
end
