require_relative 'boot'

require 'rails/all'
config.time_zone = 'Tokyo'
config.active_record.default_timezone = :local
Bundler.require(*Rails.groups)

module InstaClone
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end

  end
end
