tesco_url = 'http://www.tesco.com/groceries'

ENV['DRIVER'] ||= 'firefox_local'
# Set default driver to env variable if defined
default_driver = ENV['DRIVER'].to_sym

#################################LOCAL#########################################

Capybara.register_driver :firefox_local do |app|
   puts "Running Firefox on Local host #{Time.now.strftime '%Y-%m-%d %H:%M'}"
   profile = Selenium::WebDriver::Firefox::Profile.new
   #profile.enable_firebug
   ### Override default of firebug being open when you start the browser
   #profile["extensions.firebug.allPagesActivation"] = "off"
   profile["security.OCSP.enabled"] = 0
   profile["network.proxy.type"] = 0
   ENV['HTTP_PROXY'] = nil
   Capybara.app_host = tesco_url
   Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

Capybara.register_driver :chrome_local do |app|
  puts "Running Chrome on Local host #{Time.now.strftime '%Y-%m-%d %H:%M'}"
  ENV['HTTP_PROXY'] = nil
  ENV['PATH'] = $PROJECT_ROOT + '/drivers' + ";" + ENV['PATH']
  Capybara.app_host = tesco_url
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :ie_local do |app|
  puts "Running IE on Local host #{Time.now.strftime '%Y-%m-%d %H:%M'}"
  ENV['PATH'] = $PROJECT_ROOT + '/drivers' + ";" + ENV['PATH']
  Capybara.app_host = tesco_url
  Capybara::Selenium::Driver.new(app, :browser => :internet_explorer, :desired_capabilities => {:ignoreZoomSetting => true})
end

# Configure capybara
Capybara.configure do |config|
  config.run_server = false
  config.default_driver = default_driver
  config.default_wait_time = 120
  config.app_host = tesco_url
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
end