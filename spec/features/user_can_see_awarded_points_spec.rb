require 'rails_helper'

feature 'user can see awarded points' do
  scenario 'when logged in' do
    user = User.create(username: "sebastian",
                       password: "asdf")
    user.update(points: 50)
    visit user_path(user)

    expect(page).to have_content("Total Points: 50")
  end
end
