Geocoder.configure({
  lookup: :bing,
  key: ENV['BING_KEY'],
  api_key: ENV['BING_KEY'],
  cache: Rails.cache,
})