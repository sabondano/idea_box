class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def create
    user = User.find(params[:user_id])
    reward = Reward.find(params[:reward_id])
    if user.available_points >= reward.cost
      UserReward.create(user_id: user.id, reward_id: reward.id)
      updated_redeemed_points = user.redeemed_points + reward.cost
      user.update(redeemed_points: updated_redeemed_points)
      flash.keep[:notice] = "Congratulations! You successfully redeemed a reward."
      redirect_to user
    else
      flash.keep[:alert] = "You don't have enough points to redeem this reward."
      redirect_to rewards_path
    end
  end
end
