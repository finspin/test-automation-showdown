Feature: Login
  Scenario: Should successfully log in
    Given I am on the login page
    When I insert username, password and press login button
    Then I will be redirected to the profile page

  Scenario: Should successfully log out
    Given I am logged in
    When I click logout link
    Then I will be logged out
