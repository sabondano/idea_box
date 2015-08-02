require 'rails_helper'

feature "admin manages rewards" do
  scenario "create reward with valid input" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit rewards_path
    click_link "Manage Rewards"
    click_link "Add Reward"
    fill_in "Name", with: "iPod"
    fill_in "Cost", with: "200"
    click_button "Create Reward"

    expect(page).to have_content("iPod")
  end

  scenario "regular user cant manage rewards" do
    user = User.create(username: "sebastian",
                       password: "asdf")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit rewards_path

    expect(page).to_not have_link("Add Reward")
  end

  scenario "admin edits reward with valid input" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    Reward.create(name: "iPod",
                   cost: "200")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit rewards_path
    click_link "Manage Rewards"
    click_link "edit"
    fill_in "Name", with: "iPod Nano"
    fill_in "Cost", with: "150"
    click_button "Update Reward"

    expect(page).to have_content("iPod Nano")
    expect(page).to have_content("150")
  end

  scenario "admin deletes reward" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    Reward.create(name: "iPod",
                   cost: "200")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit rewards_path
    click_link "Manage Rewards"
    click_link "delete"

    expect(page).to_not have_content("iPod")
    expect(page).to_not have_content("200")
  end
end
