class UsersBackoffice::UsersManageController < UsersBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_user

  def edit
  end

  def update
    if params[:photo_profile].present?
      @user_manage.photo_profile = params[:photo_profile]
    end
    if @user_manage.update(user_manage_params)
      redirect_to users_backoffice_welcome_index_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @user_manage.photo_profile.purge_later
  end

  private

  def set_user
    @user_manage = current_user
  end

  def user_manage_params
    params.require(:user).permit(:email, :password, :password_confirmation, :photo_profile)
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
