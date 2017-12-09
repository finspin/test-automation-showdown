require "rspec"
require "selenium/webdriver"

describe "Login" do
  before(:all) do
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps["browserstack.user"] = ENV["BROWSERSTACK_USER"]
    caps["browserstack.key"] = ENV["BROWSERSTACK_KEY"]
    caps["build"] = ENV["TRAVIS_BUILD_NUMBER"]
    caps["os"] = "Windows"
    caps["os_version"] = "10"
    caps["browserName"] = "Chrome"
    caps["browser_version"] = "62.0"
    caps["resolution"] = "1024x768"

    @driver = Selenium::WebDriver.for(
      :remote,
      :url => "http://hub-cloud.browserstack.com/wd/hub",
      :desired_capabilities => caps
    )

    @base_url = "http://www.testmeplease.site"
  end

  after(:all) do
    @driver.quit
  end

  it "should successfully log in" do
    @driver.navigate.to @base_url + "/login"

    username = @driver.find_element(:css, "#username")
    password = @driver.find_element(:css, "#password")
    submit_button = @driver.find_element(:css, "button[type='submit']")

    username.send_keys "user"
    password.send_keys "pass"
    submit_button.click

    expect(@driver.current_url).to be == @base_url + "/profile"
  end

  it "should successfully log out" do
    @driver.navigate.to @base_url + "/login"

    username = @driver.find_element(:css, "#username")
    password = @driver.find_element(:css, "#password")
    submit_button = @driver.find_element(:css, "button[type='submit']")

    username.send_keys "user"
    password.send_keys "pass"
    submit_button.click

    @driver.find_element(:css, "a[href='/logout']").click

    expect(@driver.current_url).to be == @base_url + "/login"
  end
end
