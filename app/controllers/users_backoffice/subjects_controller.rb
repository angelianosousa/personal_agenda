class UsersBackoffice::SubjectsController < UsersBackofficeController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.all.order(id: :desc).includes(:topics).page params[:page]
  end

  def new
    @subject = Subject.new
  end

  def edit    
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to users_backoffice_subjects_path, notice: "Assunto adicionado com sucesso!!"
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to users_backoffice_subjects_path, notice: "Assunto atualizado com sucesso!!"
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy

    redirect_to users_backoffice_subjects_path, notice: "Assunto removido com sucesso!!"
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :description, topics_attributes: [:id, :name, :description, :status, :_destroy])
  end
end
