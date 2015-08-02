require 'rails_helper'

feature 'user can see awarded points' do
  scenario 'when logged in' do
    user = User.create(username: "sebastian",
                       password: "asdf",
                       points: 50)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Total Points: 50")
  end

  scenario "before logging in they can't" do
    user = User.create(username: "sebastian",
                       password: "asdf",
                       points: 50)
    visit user_path(user)

    expect(page).to_not have_content("Total Points: 50")
  end

  scenario "cant see other user's points" do
    user_1 = User.create(username: "sebastian",
                       password: "asdf",
                       points: 10)
    user_2 = User.create(username: "louis",
                       password: "asdf",
                       points: 50)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit user_path(user_2)

    expect(page).to_not have_content("Total Points: 50")
  end
end
