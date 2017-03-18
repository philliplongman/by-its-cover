source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.0.1"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "jbuilder", "~> 2.5"
gem "turbolinks", "~> 5"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "foundation-rails", "~> 5.5.2"
gem "slim"
gem "annotate"
gem "responders"
gem "autoprefixer-rails"
gem "devise"
gem "valid_email"
gem "validates_timeliness"
gem "simple_form"
gem "font-awesome-rails"


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "better_errors"
  gem "meta_request"
  gem "bullet"
end

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
  gem "awesome_print"
  gem "reek"
  gem "rspec-rails", "~> 3.4"
  gem "capybara"
  gem "factory_girl_rails"
  gem "fuubar"
end

group :test do
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem "launchy", require: false
  gem "poltergeist"
  gem "database_cleaner"
  gem "valid_attribute"
  gem "shoulda-matchers"
end

group :production, :staging do
  gem "rails_12factor"
end
