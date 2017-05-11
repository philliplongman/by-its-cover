module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_record_saved_alert do

    message = /^.+ saved\./
              # "Record saved."

    match_unless_raises do |page|
      expect(page).to have_css "div.alert-box.notice", text: message
    end

    failure_message do |page|
      "expected to find flash alert '#{message}', in: \n#{page.text}"
    end
  end

end
