class Admin::RewardsController < Admin::BaseController
  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    Reward.create(reward_params)
    redirect_to admin_rewards_path
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    Reward.find(params[:id]).update(reward_params)
    redirect_to admin_rewards_path
  end

  def destroy
    Reward.find(params[:id]).destroy
    redirect_to admin_rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end
end
