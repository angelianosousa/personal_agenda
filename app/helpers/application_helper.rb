module ApplicationHelper
  def flash_class(level)
    if level == 'notice'
      'success'
    else
      'danger'
    end
  end
end
