require 'rails_helper'

feature "admin assigns points to user" do
  scenario "with valid input" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    User.create(username: "sebastian",
                password: "asdf")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    within("li#sebastian") do
      click_link "manage points" 
    end
    fill_in "Points", with: "50"
    click_button "Award/Take Points"

    expect(page).to have_content("50")
  end

  scenario "with valid input, awarded points are added to current points" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    User.create(username: "sebastian",
                password: "asdf",
                points: 10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    within("li#sebastian") do
      click_link "manage points" 
    end
    fill_in "Points", with: "10"
    click_button "Award/Take Points"

    expect(page).to have_content("20")
  end
end

