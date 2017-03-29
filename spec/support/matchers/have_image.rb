module FeaturesMatchers
  extend RSpec::Matchers::DSL

  matcher :have_image do |asset, **attributes|

    match_unless_raises do |page|
      img = find "img[src*='#{asset}']"

      attributes.each do |attribute, value|
        expect(img[attribute]).to eq value
      end
    end

    failure_message do |page|
      "expected to find image '#{asset}' in:\n#{page.text}"
    end

  end

end
