import unittest, os
from selenium import webdriver


class Login(unittest.TestCase):

    def setUp(self):
        self.base_url = "http://www.testmeplease.site"
        self.desired_caps = {
            "browserstack.user": os.environ["BROWSERSTACK_USER"],
            "browserstack.key": os.environ["BROWSERSTACK_KEY"],
            "os": "Windows",
            "os_version": "10",
            "browserName": "Chrome",
            "browser_version": "62.0",
            "resolution": "1024x768"
        }
        self.driver = webdriver.Remote(
            command_executor="http://hub-cloud.browserstack.com/wd/hub",
            desired_capabilities=self.desired_caps
        )

    def test_should_successfully_log_in(self):
        driver = self.driver
        base_url = self.base_url

        driver.get(base_url + "/login")

        username = driver.find_element_by_id("username")
        password = driver.find_element_by_id("password")
        submit_button = driver.find_element_by_css_selector('button[type="submit"]')

        username.send_keys("user")
        password.send_keys("pass")
        submit_button.click()

        assert driver.current_url == base_url + "/profile"

    def test_should_successfully_log_out(self):
        driver = self.driver
        base_url = self.base_url

        driver.get(base_url + "/login")

        username = driver.find_element_by_id("username")
        password = driver.find_element_by_id("password")
        submit_button = driver.find_element_by_css_selector('button[type="submit"]')

        username.send_keys("user")
        password.send_keys("pass")
        submit_button.click()

        driver.find_element_by_css_selector('a[href="/logout"]').click()

        assert driver.current_url == base_url + "/login"

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
