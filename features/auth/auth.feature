Feature: Authentication tests
    Scenario: Register with payload
            Given I have a payload
                | name | dorian |
                | email | user@user.fr |
                | password | password |
                |role | user |
            When I request "POST" "/users/register" with payload
            Then The response status should be 200
            And I should have an object with the following attributes
                | name | dorian |
                | email | user@user.fr |
                | password | password |
                |role | user |

        Scenario: Login with correct credentials
            Given I have a payload
                | name | dorian |
                | email | user@user.fr |
                | password | password |
                |role | user |
            When I request "POST" "/users/authenticate" with payload
            Then The response status should be 200
            And I should have the "token" attribute

        Scenario: Login with incorrect credentials
        Given I have a payload
                | name | dorian |
                | email | user@user.fr |
                | password | zimbabwe |
                |role | user |  
            When I request "POST" "/users/authenticate" with payload
            Then The response status should be 404