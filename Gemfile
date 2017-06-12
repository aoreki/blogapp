source 'http://gems.ruby-china.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '1.3.13'
# Use Puma as the app server
gem 'puma', '3.4.0'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.1'
gem 'coffee-script-source', '1.8.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.1.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.5.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '3.1.11'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap-sass', '3.3.6'
gem 'faker', '1.6.6' # 创建虚拟用户
# 分页
gem 'bootstrap-will_paginate', '0.0.10'
gem 'will_paginate', '3.1.0'
# 图像上传
gem 'carrierwave', '0.11.2'
gem 'fog', '1.38.0'
gem 'mini_magick', '4.5.1'
# devise
gem 'devise', '4.3.0'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '9.0.0' # , platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'capistrano', '3.8.1'
  gem 'capistrano-bundler', '1.2.0'
  gem 'capistrano-passenger', '>= 0.2.0'
  gem 'mysql2'
  gem 'web-console', '3.3.0'

  # Remove the following if your app does not use Rails
  gem 'capistrano-rails', '1.2.3'

  # Remove the following if your server does not use RVM
  gem 'capistrano-rvm', '0.1.2'
end

group :test do
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
  gem 'minitest-reporters', '1.1.9'
  gem 'rails-controller-testing', '0.1.1'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
