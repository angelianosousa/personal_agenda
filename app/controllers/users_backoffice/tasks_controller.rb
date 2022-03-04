class UsersBackoffice::TasksController < UsersBackofficeController
  before_action :set_task, only: [:edit, :destroy]

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to users_backoffice_calendar_events_index_path, notice: "Atividade criada com sucesso"
    else
      redirect_to users_backoffice_calendar_events_index_path
    end
  end

  def update
    if @task.update(task_params)
      redirect_to users_backoffice_calendar_events_index_path, notice: "Atividade atualizada com sucesso!"
    else
      redirect_to users_backoffice_calendar_events_index_path
    end
  end
  
  def destroy
    @task.destroy

    redirect_to users_backoffice_calendar_events_index_url, notice: "Atividade apagada com sucesso!"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:board_id, :title, :description, :start_limit, :finish)
  end
end
