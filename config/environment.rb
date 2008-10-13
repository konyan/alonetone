RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'ruby-mp3info',  :lib => 'mp3info'
  config.gem 'rubyzip',       :lib => 'zip/zip'
  config.gem 'googlecharts',  :lib => 'gchart'
  config.gem 'rmagick',       :lib => 'RMagick'
  config.gem 'json'
  config.gem 'haml'

  # load gems from vendor
  config.load_paths += Dir["#{RAILS_ROOT}/vendor/gems/**"].map do |dir| 
    File.directory?(lib = "#{dir}/lib") ? lib : dir
  end

  config.action_controller.session = {
    :session_key => 'alonetone_com',
  }

  config.action_controller.session_store = :active_record_store

  config.active_record.observers = :user_observer

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
end