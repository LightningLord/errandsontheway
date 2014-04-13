require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = { :record => :once }
end