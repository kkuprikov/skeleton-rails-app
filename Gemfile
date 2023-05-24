# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# https://rubygems.org/gems/net-smtp
gem 'net-smtp', require: false

# https://rubygems.org/gems/net-pop
gem 'net-pop', require: false

# https://rubygems.org/gems/net-imap
gem 'net-imap', require: false

# https://rubygems.org/gems/interactor
gem 'interactor'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # RSpec
  gem 'rspec-rails'

  # https://rubygems.org/gems/factory_bot_rails
  gem 'factory_bot_rails'
end

group :development do
  # https://rubygems.org/gems/listen
  gem 'listen', '~> 3.3'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use Rubocop
  # https://rubygems.org/gems/rubocop
  gem 'rubocop'

  # https://rubygems.org/gems/rubocop-performance
  gem 'rubocop-performance'

  # https://rubygems.org/gems/rubocop-rspec
  gem 'rubocop-rspec'

  # https://rubygems.org/gems/rubocop-rails
  gem 'rubocop-rails'

  # https://rubygems.org/gems/rubocop-faker
  gem 'rubocop-faker'
end

group :test do
  # https://rubygems.org/gems/database_cleaner-active_record/
  gem 'database_cleaner-active_record'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
