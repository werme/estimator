source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'

# Use sqlite3 as the database for Active Record

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sqlite3', :group => [:development, :test]
gem 'pg', :group => [:deployment, :test]

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'haml-rails'
gem 'normalize-rails'

group :assets do
  gem "coffee-rails"
  gem "sass-rails", '~> 4.0.0.rc2'
  gem "uglifier"
end

group :development do
  gem "binding_of_caller"
  gem "quiet_assets"
  gem 'thin'
  # gem "better_errors"
end

group :test do
  gem "database_cleaner"
  gem "email_spec"
  gem "launchy"
  gem "capybara"
  gem "cucumber-rails", :require => false
end

gem "rspec-rails", :group => [:development, :test]
gem "factory_girl_rails", :group => [:development, :test]
gem "devise", :git => 'git://github.com/plataformatec/devise.git'
gem "figaro"
gem "cancan"

gem "auto_strip_attributes", "~> 1.0"

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
