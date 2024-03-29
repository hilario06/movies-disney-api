source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'factory_bot_rails', '~> 6.2'
end

group :test do
  # limpia la bd cuando se hace las pruebas
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
  # proporciona methods para escribir nuestros pruebas
  gem 'shoulda-matchers', '~> 5.1'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# add gems
gem 'faker', '~> 2.21'
gem 'rails-i18n', '~> 7.0', '>= 7.0.5'
gem 'paranoia', '~> 2.6'
# para ver en la consola los datos en la bd
gem 'table_print', '~> 1.5', '>= 1.5.7'
gem 'annotate', '~> 3.2'
# para realizar las busquedas
gem 'pg_search', '~> 2.3', '>= 2.3.6'
gem 'letter_opener', '~> 1.8', '>= 1.8.1'
