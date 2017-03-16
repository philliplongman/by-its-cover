module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_unauthorized_access_error do

    message = "You are not authorized to do that."

    match_unless_raises do |page|
      expect(page).to have_css "div.flash.flash-alert", text: message
    end

    failure_message do |page|
      "expected to find flash alert '#{message}', in: \n#{page.text}"
    end
  end

end
