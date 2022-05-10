Feature: Demo

    Feature Description

    Scenario: I should see all products
        When I request "GET" "/products"
        Then I should have an empty array
        Then I should have an array with 0 elements