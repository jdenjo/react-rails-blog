require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # set origins to your client urls
        # origins 'localhost:3000', 'localhost:5050', 'localhost:9999', 'localhost:8080'
        origins "localhost:9999"
        resource(
          "*", # this means that only routes that begin with /api/ are accessible
          headers: :any,
          credentials: true,
          methods: [:get, :post, :delete, :patch, :put, :options],
        )
      end
    end
  end
end
