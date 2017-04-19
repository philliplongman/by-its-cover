source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.1"

gem "pg", "~> 0.18"
gem "puma", "~> 3.0"

gem "foundation-rails", "~> 5.5.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "sass-rails", "~> 5.0"
gem "slim"
gem "turbolinks", "~> 5"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "uglifier", ">= 1.3.0"

gem "annotate"
gem "autoprefixer-rails"
gem "carrierwave"
gem "devise"
gem "font-awesome-rails"
gem "responders"
gem "simple_form"
gem "valid_email"
gem "validates_timeliness"

group :development do
  gem "better_errors"
  gem "listen", "~> 3.0.5"
  gem "meta_request"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "awesome_print"
  gem "capybara"
  gem "factory_girl_rails"
  gem "fuubar"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4"

  gem "bullet"

  gem "brakeman", require: false
  gem "mutant-rspec", require: false
  gem "rails_best_practices", require: false
  gem "rubycritic", require: false
  gem "traceroute", require: false
end

group :test do
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem "database_cleaner"
  gem "launchy", require: false
  gem "poltergeist"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "valid_attribute"
end

group :production, :staging do
  gem "rails_12factor"
end
