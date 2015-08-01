require 'rails_helper'

feature "admin takes points from user" do
  scenario "with valid input" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    User.create(username: "sebastian",
                password: "asdf",
                points: 50)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    within("li#sebastian") do
      click_link "manage points" 
    end
    fill_in "Points", with: "-10"
    click_button "Award/Take Points"

    expect(page).to have_content("40")
 
  end
end
