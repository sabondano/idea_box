class Reward < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
end
