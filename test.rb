require 'net/http'
require 'uri'


# Construct the URL with parameters
base_url = 'https://data.alpaca.markets/v1beta1/options/quotes/latest'
params = { 
  feed: 'indicative', 
  symbols: 'AAPL241220C00240000,AAPL241220C00260000'
}
uri = URI(base_url)
uri.query = URI.encode_www_form(params)

# Create the request
request = Net::HTTP::Get.new(uri)
request['APCA-API-KEY-ID'] = ENV['ALPACA_KEY']
request['APCA-API-SECRET-KEY'] = ENV['ALPACA_SECRET']
request['accept'] = 'application/json'

# Make the request
response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

# Print the response
puts response.body