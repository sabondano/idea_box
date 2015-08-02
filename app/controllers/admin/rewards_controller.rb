class Admin::RewardsController < Admin::BaseController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.create(reward_params)
    redirect_to rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end
end
