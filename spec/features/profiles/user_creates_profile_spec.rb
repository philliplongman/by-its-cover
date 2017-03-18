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
  # [ ] I must create a profile before I can create a collection.
  # [x] Once I save my profile, I am taken to my user page, where people can
  #     see my profile info and book collections.

  let(:user) { create :user, profile: nil }

  scenario "user fills out profile" do
    sign_in user

    expect(page).to be_new_profile_form

    fill_in "Username", with: "CallMeIshmael"
    select "Male", from: "Gender"
    within ".profile_birthday" do
      select "June", from: "profile_birthday_2i"
      select "27",   from: "profile_birthday_3i"
      select "1956", from: "profile_birthday_1i"
    end
    fill_in "Location", with: "New Bedford, Massachusetts"

    click_button "Save Profile"

    expect(page).to be_user_page_for user
    expect(page).to have_profile_saved_alert

    expect(page).to have_content "CallMeIshmael"
    expect(page).to have_content "Male, #{user.reload.age}"
    expect(page).to have_content "New Bedford, Massachusetts"
  end

  scenario "user must choose a username" do
    sign_in user

    # Don't fill out the form
    click_button "Save Profile"

    expect(page).to be_new_profile_form
    expect(page).to have_profile_not_saved_alert
    expect(page).to have_form_error "Username can't be blank"
  end

  scenario "username must be unique" do
    existing_user = create :user
    sign_in user

    fill_in "Username", with: existing_user.username
    click_button "Save Profile"

    expect(page).to be_new_profile_form
    expect(page).to have_profile_not_saved_alert
    expect(page).to have_form_error "Username has already been taken"
  end

  pending "user uploads photo"

  pending "user must have a profile to create a collection"

end
