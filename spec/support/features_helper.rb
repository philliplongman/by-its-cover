module FeaturesHelper

  def open!
    save_and_open_page
  end

  def sign_in(user)
    visit root_path
    click_link "Sign In"

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def sign_out
    click_link "Sign Out"
  end

end
