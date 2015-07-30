require 'rails_helper'

feature "logged in user can logout" do
  scenario "under normal circumstances" do
    user = User.create(username: "sebastian",
                       password: "asdf")

    visit login_path
    fill_in "Username", with: "sebastian"
    fill_in "Password", with: "asdf"
    click_button 'Login'
    visit root_path
    click_link 'logout'

    expect(page).to_not have_content("Welcome, sebastian")
  end
end
