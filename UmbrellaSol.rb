require "http"
require "json"
require "dotenv/load"

user_location = gets.chomp
pp "Check the weather at #{user_location}"

gmaps_key = ENV.fetch("GMAPS_KEY")

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

raw_gmaps_data = HTTP.get(gmaps_url)
parsed_gmaps_data = JSON.parse(raw_gmaps_data)

results_array = parsed_gmaps_data.fetch("results")
address_component = results_array.at(0).fetch("geometry")
geometry_component = address_component.fetch("location")
lat = geometry_component.fetch("lat")
long = geometry_component.fetch("lng")

# pp "Coordinates are #{lat}, #{long}."

pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_key + "/#{lat},#{long}"

# pp pirate_weather_url

response = HTTP.get(pirate_weather_url)
parsed_data = JSON.parse(response)
current_data = parsed_data.fetch("currently")
temp = current_data.fetch("temperature")

puts "It is currently #{temp}°F."

hourly_hash = parsed_data.fetch("hourly")
hourly_temp = hourly_hash.fetch("summary")

pp "For the next hour, it will be #{hourly_temp}"

precip_threshold = 0.10


