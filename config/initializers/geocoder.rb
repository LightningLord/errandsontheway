Geocoder.configure({
  lookup: :bing,
  api_key: ENV['BING_KEY'],
  cache: Rails.cache
})