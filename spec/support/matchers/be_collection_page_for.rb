module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :be_collection_page_for do |expected|

    expected.reload

    match_unless_raises do |page|
      expect(page).to have_title expected.title
      expect(page).to have_css "h1", text: expected.title
    end

    failure_message do |page|
      if !page.title.include? expected.title
        "expected page title '#{page.title}' to contain '#{expected.title}'"
      else
        "expected to find <h1> '#{expected.title}', in: \n#{page.text}"
      end
    end
  end

end
