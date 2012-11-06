# config/initializers/imgkit.rb
IMGKit.configure do |config|
  config.wkhtmltoimage = '/usr/local/bin/wkhtmltoimage' unless ENV['RACK_ENV'] == 'production'
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
  config.default_options = {
      :quality => 60
  }
  config.default_format = :png
end