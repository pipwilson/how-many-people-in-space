require 'sinatra'
require 'rest-client'

set :bind, '0.0.0.0'

get '/' do
  if !File.exist?("count") || count_is_old
    fetch_count
  else
    @count = File.open("count").readline
  end
  erb :index
end

get '/sample' do
  @count = 8
  @message = "All on the ISS"
  erb :index
end

def fetch_count
  regex = Regexp.new(/THERE ARE (.*) HUMANS IN SPACE/)
  url = 'https://whoisinspace.com/'
  html = RestClient.get(url).body.gsub!("\n", "")
  begin
    @count = html.match(regex)[1]
    File.write("count", @count)
  rescue NoMethodError
    @count = -1
  end   
end

def count_is_old
  one_hour = 60*60 # sixty seconds * sixty minutes
  if File.mtime("count") < (Time.now - one_hour)
    return true
  else
    return false
  end
end