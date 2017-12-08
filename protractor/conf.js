exports.config = {
    framework: 'jasmine2',
    specs: ['spec.js'],
    seleniumAddress: 'http://hub-cloud.browserstack.com/wd/hub',
    capabilities: {
        'browserstack.user': process.env.BROWSERSTACK_USER,
        'browserstack.key': process.env.BROWSERSTACK_KEY,
        'build': process.env.TRAVIS_BUILD_NUMBER,
        'os': 'Windows',
        'os_version': '10',
        'browserName': 'Chrome',
        'browser_version': '62.0',
        'resolution': '1024x768'
    },
    baseUrl: 'http://www.testmeplease.site',
    allScriptsTimeout: 90000,
    getPageTimeout: 60000
};
