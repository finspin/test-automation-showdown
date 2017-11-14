beforeEach(function () {
    browser.ignoreSynchronization = true;
});

it("should successfully log in", function() {
    browser.get(browser.baseUrl + '/login');
    $("#username").sendKeys("user");
    $("#password").sendKeys("pass");
    $('button[type="submit"]').click();

    expect(browser.getCurrentUrl()).toBe(browser.baseUrl + '/profile');
});
