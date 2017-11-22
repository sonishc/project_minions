require_relative 'boot'
require 'csv'
require 'rails/all'

Bundler.require(*Rails.groups)

module Minion
  class Application < Rails::Application

    config.load_defaults 5.1
    config.assets.initialize_on_precompile = false
    config.serve_static_assets = true
    config.active_job.queue_adapter = :delayed_job
    config.action_mailer.perform_caching = true

  end
end
