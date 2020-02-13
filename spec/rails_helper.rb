require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end
require 'rspec/rails'
require 'rubygems'
require 'shoulda/matchers'
require 'capybara/rspec'
require 'pry-rails'
require 'selenium-webdriver'
require 'webdrivers'
require 'capybara-screenshot/rspec'
require 'capybara/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  Shoulda::Matchers.configure do |configuration|
    configuration.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  Capybara.register_driver :logging_selenium_chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => { 'args' => ['--start-maximized'] }
    )

    client = Selenium::WebDriver::Remote::Http::Default.new(
      open_timeout: 90, read_timeout: 90
    )

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      http_client: client,
      desired_capabilities: caps
    )
  end

  Capybara.configure do |configuration|
    configuration.default_driver = :rack_test
    configuration.javascript_driver = :logging_selenium_chrome
    configuration.server_port = 3001
  end
end
