require 'rails_helper'

feature "admin sees users index" do
  scenario "when logged in as admin" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    3.times do |i|
      User.create(username: "user_#{i}",
                  password: "asdf")
    end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content("All Users")
    expect(page).to have_content("user_0 user_1 user_2")
  end
end
