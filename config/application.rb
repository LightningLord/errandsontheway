require File.expand_path('../boot', __FILE__)
# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Errandsontheway
  class Application < Rails::Application
    config.secret_key_base = 'faf7823981cfa3391ba1376eb26ff92e9030c0bb25fb885afd2637fcb8978a2534763e081324d526958136448538a7125c9658ae4595ad3e80a73cd2a02d954b'
    config.serve_static_assets = true
  end
end
