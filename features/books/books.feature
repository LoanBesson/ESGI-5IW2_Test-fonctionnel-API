Feature: books tests
    Scenario: Add books while user
        Given I load fixtures "users.json"
        And I am authenticated with "user"
        And I have a payload
            | name        | Avatar                   |
            | released_on | 2022-02-02T00:00:00.000Z |
        When I request "POST" "/books" with payload
        Then The response status should be 201
        And I should have an object with the following attributes
            | name        | Avatar                   |
            | released_on | 2022-02-02T00:00:00.000Z |

    Scenario: I should get one book
        Given I load fixtures "books.json"
        And I am authenticated with "user"
        When I request "GET" "/books/{{book1.id}}"
        And I should have an object with the following attributes
            | name        | {{book1.name}}        |
            | released_on | {{book1.released_on}} |

    Scenario: I should not retrieve the product unknown
       When I request "GET" "/books/-1"
       Then The response status should be 404
       And I should have an empty body
