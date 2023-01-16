source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"
# gem for serialzition
gem "active_model_serializers"
#gem for has secure password in user model for authentication
gem "bcrypt"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
 gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "byebug"

# gem for token based authentication of users
gem "jwt", "~> 2.6"

# gems for scraping
# gem is a client library for making requests from ruby
gem 'http'
# gem is for ssl and tls cryptography
gem 'openssl'
# gem is for handling source uris
gem 'uri'
# gem is for building http user agents
gem "net-http"
# gem is a ruby web server that encompases a parser, web server interface and network library
gem 'thin'

gem 'nokogiri'