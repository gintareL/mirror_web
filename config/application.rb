require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MirrorWeb
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("vendor", "assets", "bootstrap", "fonts")
    config.assets.precompile += %w( *.eot *.svg *.ttf *.woff *.woff2 )
    config.assets.enabled = false
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
