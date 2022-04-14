class UsersBackoffice::UserProfilesController < UsersBackofficeController
  before_action :set_user_profile, only: %i[ edit update destroy ]

  # GET /user_profiles/1/edit
  def edit
  end

  # PATCH/PUT /user_profiles/1 or /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to users_backoffice_welcome_path, notice: "Perfil atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        render :edit, alert: @user_profile.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /user_profiles/1 or /user_profiles/1.json
  def destroy
    @user_profile.destroy

    redirect_to users_backoffice_welcome_path, notice: "Perfil removido com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_profile_params
      params.require(:user_profile).permit(:fullname, :user_id, :avatar)
    end
end
