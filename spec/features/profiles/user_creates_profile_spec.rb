require 'rails_helper'

feature 'user creates profile', %Q{
  As a user who just signed up,
  I want to create a user profile
  so I can have an identity on the site.
} do

  # [x] Once I sign up, I am taken to a form to create a profile.
  # [x] I must choose a username. I can't choose an existing username.
  # [x] I can choose to list my gender, age, and location.
  # [ ] I can upload an image file as my photo.
  # [ ] I must create a profile before I can use the app.

  let(:user) { create :user, profile: nil }
  let(:existing_user) { create :user }

  scenario "user fills out profile" do
    sign_in user

    expect(page).to have_content "Create your profile"

    fill_in "Username", with: "CallMeIshmael"
    select "Male", from: "Gender"
    within ".profile_birthday" do
      select "June", from: "profile_birthday_2i"
      select "27",   from: "profile_birthday_3i"
      select "1956", from: "profile_birthday_1i"
    end
    fill_in "Location", with: "New Bedford, Massachusetts"

    click_button "Create Profile"

    expect(page).to have_content "CallMeIshmael"
    expect(page).to have_content "Male, #{user.reload.age}"
    expect(page).to have_content "New Bedford, Massachusetts"
  end

  scenario "user must choose a username" do
    sign_in user

    click_button "Create Profile"

    expect(page).to have_content "Unable to create profile. See errors below."

    error = find(".profile_username > .error").text
    expect(error).to match "Username can't be blank"
  end

  scenario "username must be unique" do
    sign_in user

    fill_in "Username", with: existing_user.username
    click_button "Create Profile"

    expect(page).to have_content "Unable to create profile. See errors below."

    error = find(".profile_username > .error").text
    expect(error).to match "Username has already been taken"


    expect(page).to have_content "Create your profile"
  end

  pending "user uploads photo"

  pending "user must have a profile to create a collection"

end
