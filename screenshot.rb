require "capybara"
require "capybara/dsl"

# This file is for taking a screenshot of the generated webpage so you can then send it elsewhere
# e.g. a thermal printer

Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.current_driver = :selenium_chrome

include Capybara::DSL

# 3. navigate to your site
visit "http://127.0.0.1:4567/fetch"

Capybara.page.current_window.resize_to(500,450)

# 4. take a screenshot and save it to a file
page.save_screenshot("space.png")