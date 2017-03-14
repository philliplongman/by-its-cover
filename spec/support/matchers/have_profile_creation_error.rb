module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_profile_creation_error do

    message = "Unable to create profile. See errors below."

    match_unless_raises do |page|
      expect(page).to have_css "div.flash.flash-alert", text: message
    end

    failure_message do |page|
      "expected to find flash alert '#{message}', in: \n#{page.text}"
    end
  end

end