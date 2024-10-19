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
geometry_component = 

pp address_component


# response = HTTP.get("https://en.wikipedia.org/wiki/Chicago")

# Fetch the latitude and longitude of the exact location 


# Place a GET request to the URL


# Fetching key for the Pirate_Weather
# pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_API_KEY")

# # Assemble the full URL string by adding the first part, the API token, and the last part together
# pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"
