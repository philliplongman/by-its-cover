module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_profile_not_saved_alert do

    message = "Unable to save profile. See errors below."

    match_unless_raises do |page|
      expect(page).to have_css "div.alert-box.alert", text: message
    end

    failure_message do |page|
      "expected to find flash alert '#{message}', in: \n#{page.text}"
    end
  end

end
