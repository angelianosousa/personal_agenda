class UsersBackoffice::CalendarsController < UsersBackofficeController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @my_steps = Step.steps_by_deadline(current_user.objectives.ids).where(deadline: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
