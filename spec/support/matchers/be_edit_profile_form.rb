module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :be_edit_profile_form do

    title = "Update your profile"

    match_unless_raises do |page|
      expect(page).to have_title title
      expect(page).to have_css "h1", text: title
    end

    failure_message do |page|
      if page.title != title
        "expected page title to be '#{title}', got '#{page.title}'"
      else
        "expected to find <h1> '#{title}', in: \n#{page.text}"
      end
    end
  end

end
