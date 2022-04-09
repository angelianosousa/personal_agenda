module UsersBackoffice::TasksHelper
  def task_style(object)
    today = Date.today.to_datetime

    if object.finish
      "badge badge-success"
    else
      if object.start_time > today
        "badge-badge-info"
      elsif object.start_time == today
        "badge badge-warning"
      else
        "badge badge-danger"
      end
    end
    
  end

  def boards_for_select
    Board.all.collect { |board| [board.title, board.id]}
  end
end
