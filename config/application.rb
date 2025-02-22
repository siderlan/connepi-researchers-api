require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ConnepiResearchersApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Configure CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:8080', 'https://dashboard-tcc-arthur-novaes.netlify.com'
        resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
