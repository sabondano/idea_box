class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    total_points = params[:user][:points].to_i + @user.points
    @user.update(points: total_points)
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:points)
  end
end
