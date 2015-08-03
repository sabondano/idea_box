class AddRedeemedPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :redeemed_points, :integer, default: 0
  end
end
