Feature: API Test Scenarios

    As an Test User
    I would like to make HTTP requests to an API endpoint
    So that I can prove the system works

    Background: API Is Healthy
        Given the service is up and running

    @scn1
    Scenario Outline: I can make a successful GET request
        When I send a <method> request to the endpoint <endpoint>
        Then I should see the correct data ID <dataId>

        Examples:
            | method | endpoint   | dataId |
            | GET    | "/posts/1" | 1      |

    @scn2
    Scenario Outline: I can make a successful POST request
        When I send a <method> request to the endpoint <endpoint>
        Then I verify that the status is 201

        Examples:
            | method | endpoint |
            | POST   | "/posts" |

    @scn3
    Scenario Outline: I can make a successful DELETE request
        And I send a <method> request to the endpoint <endpoint>
        And I verify that the status is 200
        When I send a <method2> request to the endpoint <endpoint2>
        Then I verify that the status is 404

        Examples:
            | method | endpoint   | method2 | endpoint2  |
            | DELETE | "/posts/1" | GET     | "/posts/1" |