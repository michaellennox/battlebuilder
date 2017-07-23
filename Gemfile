source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', git: 'git@github.com:hanami/model.git', branch: 'develop'

gem 'pg'

gem 'slim'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
  gem 'byebug'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
end

group :production do
  # gem 'puma'
end
