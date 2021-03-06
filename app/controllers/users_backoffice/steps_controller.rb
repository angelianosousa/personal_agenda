class UsersBackoffice::StepsController < UsersBackofficeController
  before_action :set_step, only: %i[ show edit update destroy check_step uncheck_step ]

  # TODO Make sure the pagination is works for index action
  # GET /steps or /steps.json
  def index
    # @steps = Step.steps_by_deadline(current_user.objectives.ids).page(params[:page])

    count_objects_per_page = 5
    @steps = Step.index_scope(current_user, params[:page], count_objects_per_page)
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1 or /steps/1.json
  def show
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps or /steps.json
  def create
    @step = Step.new(step_params)
    @step.user_id = current_user.id

    respond_to do |format|
      if @step.save
        format.html { redirect_to users_backoffice_steps_path, notice: "Step was successfully created." }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_step
    @step.update done: true
    @step.objective.steps_finish += 1
    @step.objective.save
    redirect_to users_backoffice_steps_url, notice: "Passo marcado com sucesso!"
  end

  def uncheck_step
    @step.update done: false
    @step.objective.steps_finish -= 1
    @step.objective.save
    redirect_to users_backoffice_steps_url, notice: "Passo desmarcado com sucesso!"
  end

  # PATCH/PUT /steps/1 or /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to users_backoffice_steps_path, notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1 or /steps/1.json
  def destroy
    @step.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_steps_url, notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def step_params
      params.require(:step).permit(:objective_id, :name, :deadline, :description, :done)
    end
end
