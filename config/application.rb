require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module SlobodaApp
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
