module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :be_user_page_for do |expected|

    expected.reload

    match_unless_raises do |page|
      expect(page).to have_title expected.username
      expect(page).to have_css "h1", text: expected.username
    end

    failure_message do |page|
      if page.title != title
        "expected page title to be '#{expected.username}', got '#{page.title}'"
      else
        "expected to find <h1> '#{expected.username}', in: \n#{page.text}"
      end
    end
  end

end