# config/initializers/sidekiq.rb

# Sidekiq.configure_server do |config|
#     config.redis = { url: 'redis://localhost:3000/0', namespace: "app3_sidekiq_#{Rails.env}" }
#   end
  
#   Sidekiq.configure_client do |config|
#     config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
#   end

Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 4, network_timeout: 5 }
  end
  
Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 4, network_timeout: 5 }
end