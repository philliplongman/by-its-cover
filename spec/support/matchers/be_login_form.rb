# frozen_string_literal: true

module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :be_login_form do

    title = "Log in"

    match_unless_raises do |page|
      expect(page).to have_title title
      expect(page).to have_css "h2", text: title
    end

    failure_message do |page|
      if !page.title.include? title
        "expected page title '#{page.title}' to contain '#{title}'"
      else
        "expected to find <h1> '#{title}', in: \n#{page.text}"
      end
    end
  end

end
