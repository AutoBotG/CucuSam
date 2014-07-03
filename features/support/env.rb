$PROJECT_ROOT = File.expand_path(File.dirname(__FILE__) + '/../..')

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubygems'
require 'selenium/webdriver'
require 'require_all'

require_all File.dirname(__FILE__) + '/helpers'

## Tidy out folder containing last runs cuke report and screenshots
out_dir = File.dirname(__FILE__) + '/../out/'
MyHelper::prep_cuke_folder(out_dir)

# Maximize window so screenshot displays nicely unless we're using poltergeist
Capybara.current_session.driver.browser.manage.window.maximize

