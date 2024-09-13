source 'https://rubygems.org'

def os_is(re)
  RbConfig::CONFIG['host_os'] =~ re
end

group :development, :test do
  gem "rerun"
  gem 'wdm', '>= 0.1.0', platforms: [:windows]
end

gem "sinatra"
gem "puma"
gem "rackup"
gem "rest-client"