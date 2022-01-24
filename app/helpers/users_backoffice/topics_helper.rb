module UsersBackoffice::TopicsHelper
  def topic_style(object)
    if object.status == "em andamento"
      "warning"
    elsif object.status == "pendente"
      "danger"
    else
      "success"
    end
  end
end
