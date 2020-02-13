require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoList
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller

    config.load_defaults 5.2
    config.i18n.available_locales = ["pt-BR", :en]
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'
  end
end
