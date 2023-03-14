module Admin
  class UsersController < BaseController
    before_action :authenticate_user!
    before_action :set_user!, only: %i[destroy edit update]
    before_action :authorize_user!
    after_action :verify_authorized
  
    def create
    end
  
    def destroy
      @user.destroy
      flash[:success] = 'User deleted!'
      redirect_to admin_users_path
    end
  
    def edit 
    end
  
    def index
      @users = User.all
    end
  
    def update
      
      if @user.update user_params
        flash[:success] = 'User updated!'
        redirect_to admin_users_path
      else
        render :edit
      end
    end
  
    private
  
  
    def set_user!
      @user = User.find params[:id]
    end
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :role)
    end
  
    def authorize_user!
      authorize(@user || User) 
    end
  end
end







