class UsersBackoffice::ObjectivesController < UsersBackofficeController
  before_action :set_objective, only: %i[ show edit update destroy ]

  # GET /objectives or /objectives.json
  def index
    @objectives = Objective.order(id: :desc).includes(:steps).page(params[:page])
  end

  # GET /objectives/new
  def new
    @objective = Objective.new
  end

  # GET /objectives/1/edit
  def edit
  end

  # POST /objectives or /objectives.json
  def create
    @objective = Objective.new(objective_params)
    @objective.user_id = current_user.id

    respond_to do |format|
      if @objective.save
        format.html { redirect_to users_backoffice_objectives_path, notice: "Objective was successfully created." }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1 or /objectives/1.json
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to users_backoffice_objectives_path, notice: "Objective was successfully updated." }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1 or /objectives/1.json
  def destroy
    @objective.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_objectives_url, notice: "Objective was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def objective_params
      params.require(:objective).permit(:user_id, :name, :deadline, steps_attributes: [:id, :name, :description, :deadline, :done, :_destroy])
    end
end
