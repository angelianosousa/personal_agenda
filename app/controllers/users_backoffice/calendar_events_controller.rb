class UsersBackoffice::CalendarEventsController < UsersBackofficeController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    
    @tasks = Task.search_tasks(current_user, start_date)
  end
end
