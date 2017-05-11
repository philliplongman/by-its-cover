module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :be_new_collection_form do

    title = "Create a collection"

    match_unless_raises do |page|
      expect(page).to have_title title
      expect(page).to have_css "h1", text: title
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
