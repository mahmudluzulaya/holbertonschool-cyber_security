require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  
  if uri.scheme == 'https'
    http.use_ssl = true
  end

  request = Net::HTTP::Post.new(uri.path.empty? ? '/' : uri.path, { 'Content-Type' => 'application/json' })
  request.body = body_params.to_json

  response = http.request(request)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  begin
    parsed = JSON.parse(response.body)
    if parsed.empty?
      puts "{}"
    else
      puts JSON.pretty_generate(parsed)
    end
  rescue
    puts response.body
  end
end
