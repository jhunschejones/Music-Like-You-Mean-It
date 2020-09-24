source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'closure-compiler'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'newrelic_rpm'
gem 'rack-attack'

gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'mailgun-ruby', git: 'https://github.com/mailgun/mailgun-ruby/', tag: 'v1.2.2'
gem 'premailer-rails'

gem 'bcrypt'
gem 'lockbox'
gem 'blind_index'

gem 'font_awesome5_rails'
gem 'bulma-rails'
gem 'will_paginate'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'minitest-rails'
  gem 'database_cleaner'
  gem 'mocha'
end
