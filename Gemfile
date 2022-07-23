# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'devise'
gem 'interactor-rails', '~> 2.0'
gem 'jsonapi-serializer'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.1'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end

group :development do
  gem 'brakeman'
  gem 'rails_best_practices', '~> 1.23'
  gem 'rubycritic', require: false
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

gem 'annotate', '~> 3.2'
gem 'jsonapi-serializer'

