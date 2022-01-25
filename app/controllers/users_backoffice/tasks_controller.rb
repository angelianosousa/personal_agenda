class UsersBackoffice::TasksController < UsersBackofficeController
  before_action :set_task, except: [:create]

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to users_backoffice_calendar_events_index_path, notice: "Atividade adicionada com sucesso"
    else
      redirect_to users_backoffice_calendar_events_index_path
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to users_backoffice_subjects_path, notice: "Atividade atualizado com sucesso!"
    else
      redirect :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to users_backoffice_subjects_path, notice: 'Atividade excluída com sucesso!'
    else
      redirect_to users_backoffice_subjects_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:subject_id, :title, :description, :start_time, :finish)  
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
