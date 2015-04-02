Rails.application.config.after_initialize do
  if defined?(Bullet)
    Bullet.enable = true
    Bullet.console = true
    Bullet.rails_logger = true
  end
end
