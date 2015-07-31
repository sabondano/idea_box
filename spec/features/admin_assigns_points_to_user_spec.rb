require 'rails_helper'

feature "admin assigns points to user" do
  scenario "with valid input" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    3.times do |i|
      User.create(username: "user_#{i}",
                  password: "asdf")
    end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    within("li#user_0") do
      click_link "manage points" 
    end
    fill_in "Points", with: "50"
    click_button "Award Points"

    expect(page).to have_content("50")
  end
end

