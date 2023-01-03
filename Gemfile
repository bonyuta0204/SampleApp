source 'https://rubygems.org'

gem 'rails',        '~>5.2.4'
gem 'puma'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'bcrypt'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'faker'
gem 'carrierwave'
gem 'mini_magick'
gem 'jbuilder'
gem 'therubyracer'
gem 'will_paginate'
gem 'bootstrap-will_paginate'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'pry-rails' # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc' # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'rails-controller-testing'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
end

group :production do
  gem 'pg'
  gem 'fog'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
