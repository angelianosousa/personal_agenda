class UsersBackoffice::TopicsController < UsersBackofficeController
  before_action :set_topic

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to users_backoffice_subjects_path, notice: "Topico atualizado com sucesso!"
    else
      redirect :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to users_backoffice_subjects_path, notice: 'Atividade escluída com sucesso!'
    else
      redirect_to users_backoffice_subjects_path
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:subject_id, :title, :description, :due_to, :status)  
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
