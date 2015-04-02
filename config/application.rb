require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CDP
  class Application < Rails::Application
    config.to_prepare do
      Dir[Rails.root.join('{app,lib}/**/*_decorator*.rb')].each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.active_record.raise_in_transactional_callbacks = true
    config.action_view.raise_on_missing_translations = true
    config.password_protected = false
  end
end
