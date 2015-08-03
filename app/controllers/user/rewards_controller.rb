class User::RewardsController < Application::Controller
  def create
    user = User.find(params[:user][:id])
    require 'pry'; binding.pry
    redirect_to user
  end
end
