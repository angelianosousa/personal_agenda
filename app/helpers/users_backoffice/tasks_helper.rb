module UsersBackoffice::TasksHelper
  def task_style(object)
    if object.finish
      "badge badge-success fa fa-check"
    else
      if object.start_time >= Date.today.to_datetime
        "badge badge-warning fa fa-warning"
      else
        "badge badge-danger fa fa-times-circle"
      end
    end

  end

end
