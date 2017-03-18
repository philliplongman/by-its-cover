require 'rails_helper'

feature 'user updates profile', %Q{
  As a signed in user,
  I want to update my profile
  so I can change what others see about me.
} do

  # [x] When signed in, I should see my username in the navbar.
  # [x] If I click on it, I am taken to my user page.
  # [x] I should see a link to update my profile info. If I click it, I am
  #     taken to a form to do that.
  # [ ] Only I can edit my profile.
  # [x] Once I save my profile, I am returned to my user page.

  let(:user) { create :user }

  scenario "user updates profile information" do
    sign_in user
    click_link user.username
    click_link "Update my profile"

    expect(page).to be_edit_profile_form

    fill_in "Username", with: "DanishGirl"
    select "Trans Female", from: "Gender"
    within ".profile_birthday" do
      select "September", from: "profile_birthday_2i"
      select "5",         from: "profile_birthday_3i"
      select "2015",      from: "profile_birthday_1i"
    end
    fill_in "Location", with: "Copenhagen, Denmark"

    click_button "Save Profile"

    expect(page).to be_user_page_for user
    expect(page).to have_profile_saved_alert

    expect(page).to have_content "DanishGirl"
    expect(page).to have_content "Trans Female, #{user.reload.age}"
    expect(page).to have_content "Copenhagen, Denmark"
  end

  pending "user only has access to their own profile" do
    vandal = create :user
    sign_in vandal

    visit edit_user_profile_path(user)

    expect(page).not_to be_edit_profile_form
    expect(page).to have_unauthorized_access_error
  end

  pending "user updates profile photo"

end
