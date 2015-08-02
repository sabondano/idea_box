require 'rails_helper'

feature "admin manages rewards" do
  scenario "creates rewards with valid input" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit rewards_path
    click_link "Add Reward"
    fill_in "Name", with: "iPod"
    fill_in "Cost", with: "200"
    click_button "Create Reward"

    expect(page).to have_content("iPod")
  end

  scenario "regular users cant add rewards" do
    user = User.create(username: "sebastian",
                       password: "asdf")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit rewards_path

    expect(page).to_not have_link("Add Reward")
  end
end
