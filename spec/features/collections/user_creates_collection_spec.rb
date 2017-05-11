require 'rails_helper'

feature 'user creates collection', %Q{
  As an authenticated user,
  I want to create a collection,
  so I can add books to show off.
} do

  # [ ] When I visit the site, I should see a link in the nav to add a collection.
  # [ ] If I click on it and am not signed in, it should redirect me to sign in.
  # [ ] If I am signed in, it should send me to a form to create a collection.
  # [ ] I must choose a title of no more than 100 characters.
  # [ ] I cannot use the same title more than once.
  # [ ] I can optionally add a description of no more than 500 characters.
  # [ ] Once I create the collection, I am taken to it's show page.

  let(:user) { create :user }

  scenario "user creates a collection" do
    sign_in user
    click_link "Create a collection"

    expect(page).to be_new_collection_form

    fill_in "Title", with: "My favorite books"
    fill_in "Description", with: "These are some of my favorite books."
    click_button "Create Collection"

    expect(page).to be_collection_page_for Collection.last
    expect(page).to have_record_saved_alert

    expect(page).to have_content "My favorite books"
    expect(page).to have_content "These are some of my favorite books."
  end

  scenario "user doesn't enter a title" do
    sign_in user
    click_link "Create a collection"

    click_button "Create Collection"

    expect(page).to be_new_collection_form
    expect(page).to have_record_not_saved_alert
    expect(page).to have_form_error "Title can't be blank"
  end

  scenario "user tries to use a title twice" do
    collection = create(:collection, user: user)

    sign_in user
    click_link "Create a collection"

    fill_in "Title", with: collection.title
    click_button "Create Collection"

    expect(page).to be_new_collection_form
    expect(page).to have_record_not_saved_alert
    expect(page).to have_form_error "Title has already been taken"
  end

  scenario "user tries to create a collection without signing in" do
    click_link "Create a collection"

    expect(page).to be_login_form
  end

end
