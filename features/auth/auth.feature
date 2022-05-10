Feature: Authentication tests
    Scenario: Login with correct credentials
        Given I am on the login page
        When I send request with correct credentials
        Then I should be logged in

    Scenario: Login with incorrect credentials
        Given I am on the login page
        When I send request with incorrect credentials
        Then I should not be logged in