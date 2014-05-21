BwUpload::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.i18n.enforce_available_locales = false
  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load
  config.action_mailer.default_url_options = { host: "localhost" }

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.paperclip_defaults = {   
    :url => "/downloads/:hash.:extension",
    :hash_secret => "5351b50800449430d7be29f9d6d8cd04aa1589e784221b703310bcac1172b4d9"    
  }
  
  config.assets.debug = true
  
  config.action_mailer.perform_deliveries = false
  config.action_mailer.delivery_method = :smtp  
end
