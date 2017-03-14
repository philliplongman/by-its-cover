require 'rails_helper'

feature 'user updates profile', %Q{
  As a signed in user,
  I want to update my profile
  so I can change what others see about me.
} do

  let(:user) { create :user }
  let(:vandal) { create :user }

  scenario "user updates profile information" do
    sign_in user
    click_link user.username
    click_link "Update my profile"

    expect(page).to have_content "Update your profile"

    fill_in "Username", with: "DanishGirl"
    select "Trans Woman", from: "Gender"
    within ".profile_birthday" do
      select "September", from: "profile_birthday_2i"
      select "5",         from: "profile_birthday_3i"
      select "2015",      from: "profile_birthday_1i"
    end
    fill_in "Location", with: "Copenhagen, Denmark"

    click_button "Update Profile"

    expect(page).to have_content "DanishGirl"
    expect(page).to have_content "Trans Woman, #{user.reload.age}"
    expect(page).to have_content "Copenhagen, Denmark"
  end

  pending "user cannot access another's profile" do
    sign_in vandal
    visit edit_user_profile_path(user)
    
    expect(page).not_to have_content "Update your profile"
    expect(page).to have_content "You are not authorized to do that"
  end

  pending "user updates profile photo"

end
