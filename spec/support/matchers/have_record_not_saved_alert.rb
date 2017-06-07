module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_record_not_saved_alert do

    message = /^.+could not be saved\./ # "Record could not be saved."

    match_unless_raises do |page|
      expect(page).to have_css "div.alert-box.alert", text: message
    end

    failure_message do |page|
      "expected to find flash alert '#{message}', in: \n#{page.text}"
    end
  end

end
