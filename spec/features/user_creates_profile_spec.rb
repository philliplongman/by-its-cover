require 'rails_helper'

feature 'user creates profile', %Q{
  As a user who just signed up,
  I want to create a user profile
  so I can have an identity on the site.
} do

  # [ ] Once I sign up, I am taken to a form to create a profile.
  # [ ] I can upload an image file as my photo.
  # [ ] I must choose a username. I can't choose an existing username.
  # [ ] I must create a profile before I can use the app.

  let(:user) { create :user }
  # let(:user) { create :user, profile: nil }
  let(:existing_user) { create :user }

  scenario "user fills out profile" do
    sign_in user

    expect(page).to have_content "Create your profile"

    fill_in "Username", with: "CallMeIshmael"
    select "Male", from: "Gender"
    within "#birthday" do
      select "June", from: "Month"
      select "27",   from: "Day"
      select "1956", from: "Year"
    end
    fill_in "City", with: "New Bedford"
    select "MA", from: "State"

    click_button "Create Profile"

    expect(page).to have_content "CallMeIshmael"
    expect(page).to have_content user.age
    expect(page).to have_content "New Bedford, MA"
  end

  scenario "user must choose a username" do
    sign_in user
    click_button "Create Profile"

    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Create your profile"
  end

  scenario "username must be unique" do
    sign_in user
    fill_in "Username", with: existing_user.username
    click_button "Create Profile"

    expect(page).to have_content "Sorry. That username is already taken."
    expect(page).to have_content "Create your profile"
  end

  pending "user uploads photo"

end
