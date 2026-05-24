require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  begin
    parsed = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed)
  rescue
    puts response.body
  end
end
