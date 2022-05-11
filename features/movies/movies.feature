Feature: Movies tests
    Scenario: Add movies while user
        Given I load fixtures "users.json"
        And I am authenticated with "user"
        And I have a payload
            | name  | Avatar     |
            | released_on | 2022-02-02T00:00:00.000Z |
        When I request "POST" "/movies" with payload
        Then The response status should be 201
        And I should have an object with the following attributes
            | name  | Avatar     |
            | released_on | 2022-02-02T00:00:00.000Z |
