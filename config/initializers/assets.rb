Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.precompile += %w(application.js application.css)

Rails.application.config.assets.configure do |env|
  env.logger = Rails.logger
end

Rails.application.config.quiet_assets = true
