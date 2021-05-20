source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'pry'
gem 'faraday'
gem 'figaro'
gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'faker'
gem 'omniauth-google-oauth2'
gem 'omniauth'
gem 'orderly'
gem 'fast_jsonapi'
# gem 'securerandom'



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :development do
  gem 'travis'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
