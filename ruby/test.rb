require "test/unit"
require "selenium-webdriver"


class Login < Test::Unit::TestCase

  def setup
    @base_url = "http://www.testmeplease.site"
    desired_capabilities = Selenium::WebDriver::Remote::Capabilities.new
    desired_capabilities["browserstack.user"] = ENV["BROWSERSTACK_USER"]
    desired_capabilities["browserstack.key"] = ENV["BROWSERSTACK_KEY"]
    desired_capabilities["os"] = "Windows"
    desired_capabilities["os_version"] = "10"
    desired_capabilities["browserName"] = "Chrome"
    desired_capabilities["browser_version"] = "62.0"
    desired_capabilities["resolution"] = "1024x768"
    @driver = Selenium::WebDriver.for(
      :remote,
      :url => "http://hub-cloud.browserstack.com/wd/hub",
      :desired_capabilities => desired_capabilities
    )

  end

  def test_should_successfully_log_in
    @driver.get @base_url + "/login"

    username = @driver.find_element(:css, "#username")
    password = @driver.find_element(:css, "#password")
    submit_button = @driver.find_element(:css, "button[type='submit']")

    username.send_keys "user"
    password.send_keys "pass"
    submit_button.click

    assert(@driver.current_url == @base_url + "/profile")
  end

  def test_should_successfully_log_out
    @driver.get @base_url + "/login"

    username = @driver.find_element(:css, "#username")
    password = @driver.find_element(:css, "#password")
    submit_button = @driver.find_element(:css, "button[type='submit']")

    username.send_keys "user"
    password.send_keys "pass"
    submit_button.click

    @driver.find_element(:css, "a[href='/logout']").click

    assert(@driver.current_url == @base_url + "/login")
  end

  def teardown
    @driver.quit
  end

end
