# frozen_string_literal: true

require_relative 'boot'

require 'action_cable/engine'
require 'action_controller/railtie'
require 'action_mailbox/engine'
require 'action_mailer/railtie'
require 'action_text/engine'
require 'action_view/railtie'
require 'active_job/railtie'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'rails'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SkeletonRailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.autoload_paths << "#{root}/app/interactors"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.pass_threshold = 80
  end
end
