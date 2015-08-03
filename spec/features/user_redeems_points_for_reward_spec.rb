require 'rails_helper'

feature "user redeems points for reward" do
  scenario "with enough points" do
    user = User.create(username: "sebastian",
                       password: "asdf",
                       points: 50)
    Reward.create(name: "iPod",
                  cost: "40")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit rewards_path
    click_link "redeem"

    expect(page).to have_content("iPod")
    expect(page).to have_content("10")
  end

  scenario "twice" do
    user = User.create(username: "sebastian",
                       password: "asdf",
                       points: 100)
    Reward.create(name: "iPod",
                  cost: "40")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    2.times do 
      visit rewards_path
      click_link "redeem"
    end

    expect(page).to have_content("iPod")
    expect(page).to have_content("20")
  end
end
