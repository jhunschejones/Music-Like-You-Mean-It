source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'closure-compiler', git: 'https://github.com/hmdne/closure-compiler', tag: '1.1.17'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'newrelic_rpm'
gem 'rack-attack'
gem 'rexml' # no longer included in Ruby 3.x, some gems use this but have not listed it as a dependency yet

gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'mailgun-ruby'
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
