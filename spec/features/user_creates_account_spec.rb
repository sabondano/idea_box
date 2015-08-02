require 'rails_helper'

feature 'user creates account' do
  scenario 'with valid input' do
    visit root_path

    click_link "Create Account"
    fill_in "Username", with: "sebastian"
    fill_in "Password", with: "asdf"
    click_button "Create Account"

    expect(page).to have_content("Welcome, sebastian")
  end
end
