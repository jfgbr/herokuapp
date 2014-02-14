source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.2'

# Use mysql as the database for Active Record
#gem 'mysql2'
group :development , :test do
  gem 'rspec-rails', '2.13.1'
  gem 'mysql2', '0.3.15'
#  gem 'mysql', '2.9.1'
#  gem "ruby-mysql", "~> 2.9.12"
  gem 'capybara'
end

group :test do
  gem 'factory_girl_rails', '4.2.1'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner'#, github: 'bmabey/database_cleaner'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'bcrypt-ruby', '3.1.2'
gem 'will_paginate', '3.0.5'
gem 'faker', '1.1.2'
#gem 'dependent-fields-rails'
gem "railties"
#gem "bootstrap-combobox"

#gem 'bootstrap-sass', '2.3.2.0'
gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails'
#gem 'jquery-ui-rails'
gem 'turbolinks', '1.1.1'
gem 'jquery-turbolinks'
gem 'jbuilder', '1.2'

#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
#gem "twitter-bootstrap-rails"
#gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem 'execjs'
gem 'therubyracer', :platforms => :ruby

group :doc do
  gem 'sdoc', require: false
end
