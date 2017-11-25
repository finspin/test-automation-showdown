import unittest
from selenium import webdriver

class Login(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()
        self.base_url = "http://www.testmeplease.site"

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

    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()