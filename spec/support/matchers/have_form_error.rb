module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_form_error do |expected|

    match_unless_raises do |page|
      expect(page).to have_css ".error", text: expected
    end

    failure_message do |page|
      "expected to find from error '#{expected}' in:\n#{page.text}"
    end
  end

end
