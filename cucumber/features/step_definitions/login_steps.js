const defineSupportCode = require('cucumber').defineSupportCode;
const assert = require('assert');
const webdriver = require('selenium-webdriver');

const caps = {
    'browserstack.user': process.env.BROWSERSTACK_USER,
    'browserstack.key': process.env.BROWSERSTACK_KEY,
    'build': process.env.TRAVIS_BUILD_NUMBER,
    'os': 'Windows',
    'os_version': '10',
    'browserName': 'Chrome',
    'browser_version': '62.0',
    'resolution': '1024x768'
}

const driver = new webdriver.Builder()
  .usingServer('http://hub-cloud.browserstack.com/wd/hub')
  .withCapabilities(caps)
  .build();

const baseUrl = 'http://www.testmeplease.site';

defineSupportCode(function({ Given, Then, When, AfterAll, setDefaultTimeout }) {
    setDefaultTimeout(20000);

    AfterAll(function () {
        return driver.quit();
    });

    Given('I am on the login page', function () {
        return driver.get(baseUrl + '/login');
    });

    Given('I am logged in', function () {
        return driver.get(baseUrl + '/login')
            .then(function () {
                driver.findElement({ id: 'username'}).sendKeys('user')
            }).then(function () {
                return driver.findElement({ id: 'password'}).sendKeys(('pass'))
            }).then(function () {
                return driver.findElement({ css: 'button[type="submit"]'}).click();
            });
    });

    When('I insert username, password and press login button', function () {
        return driver.findElement({ id: 'username'}).sendKeys('user')
            .then(function () {
                return driver.findElement({ id: 'password'}).sendKeys(('pass'))
            }).then(function () {
                return driver.findElement({ css: 'button[type="submit"]'}).click();
            });
    });

    When('I click logout link', function () {
        return driver.findElement({ css: 'a[href="/logout"]'}).click();
    });

    Then('I will be redirected to the profile page', function () {
        return driver.getCurrentUrl().then(function (url) {
            assert(url === baseUrl + '/profile');
        });
    });

    Then('I will be logged out', function () {
        return driver.getCurrentUrl().then(function (url) {
            assert(url === baseUrl + '/login');
        });
    });
});
