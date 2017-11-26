# Test Automation Showdown

[![build status](https://api.travis-ci.org/finspin/test-automation-showdown.svg?branch=master "build status")](https://travis-ci.org/finspin/test-automation-showdown)
[![BrowserStack Status](https://www.browserstack.com/automate/badge.svg?badge_key=N0poM0poZG5hTWgvaGcyNWJBQk5TbDhubTQ4R3orMzVRYlpBV3F3cHcrVT0tLVdsb3pZeFlpbEpMRVZ0YzRBQ0FMN3c9PQ==--1ce53b9e0dd211b880f1d9be2fea206a8c31a52c)](https://www.browserstack.com/automate/public-build/N0poM0poZG5hTWgvaGcyNWJBQk5TbDhubTQ4R3orMzVRYlpBV3F3cHcrVT0tLVdsb3pZeFlpbEpMRVZ0YzRBQ0FMN3c9PQ==--1ce53b9e0dd211b880f1d9be2fea206a8c31a52c)


The aim of this repository is to provide overview of different test automation frameworks by implementing the same tests with each framework. Each implementation is located in a separate directory and can be run independently from others.

## What is tested

Each test automation framework implements the same set of tests. The tests verify the functionality on [www.testmeplease.site](http://www.testmeplease.site) - a web application which has been developed specifically for this showdown project.

## What is currently implemented

|Test Case|Protractor|Robot Framework|Python|Ruby|
|---|---|---|---|---|
|Login|:white_check_mark:|:white_check_mark:|:white_check_mark:|:white_check_mark:|
|Logout|:x:|:x:|:x:|:x:|
|Ajax|:x:|:x:|:x:|:x:|
|Alerts|:x:|:x:|:x:|:x:|
|Drag & Drop|:x:|:x:|:x:|:x:|
|Forms|:x:|:x:|:x:|:x:|
|Modals|:x:|:x:|:x:|:x:|
|Search|:x:|:x:|:x:|:x:|
|[add more]|||||

## How are the tests executed

All tests are executed from [Travis CI](https://travis-ci.org/finspin/test-automation-showdown) and they run on browsers provided by [BrowserStack](https://www.browserstack.com/automate/public-build/N0poM0poZG5hTWgvaGcyNWJBQk5TbDhubTQ4R3orMzVRYlpBV3F3cHcrVT0tLVdsb3pZeFlpbEpMRVZ0YzRBQ0FMN3c9PQ==--1ce53b9e0dd211b880f1d9be2fea206a8c31a52c) - a cloud-based platform for running browser tests.

## Contributing

Any contribution is welcome. Please submit bug fixes or new test automation framework implementations via pull request.

## Thanks

Special thanks to [BrowserStack](https://www.browserstack.com/) who have provided their cloud-based platform for this project free of charge.
