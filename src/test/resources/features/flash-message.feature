Feature: Test flash-message API

Background:
* url baseUrl

Scenario: Insert one element

    # list
    Given path 'flash-message'
    When method GET
    Then status 200
    And match response == '#[]'

    * def length = response.length

    # create
    Given path 'flash-message'
    And request { active: true, content: "Hello World" }
    When method POST
    Then status 201
    And match header Location == '#present'
    And match response ==
    """
    {
        @id: '#present',
        content: "Hello World",
        active: true
    }
    """

    * def message = response
    * def message_url = responseHeaders['Location'][0]

    # get by response body
    Given path 'flash-message', message['@id']
    When method GET
    Then status 200
    And match response == message

    # get by response header
    Given url message_url
    When method GET
    Then status 200
    And match response == message

    * url baseUrl

    # list
    Given path 'flash-message'
    When method GET
    Then status 200
    And assert response.length == length + 1

    * def new_message = { content: "Hello Dou²", active: false }

    # update
    Given path 'flash-message', message['@id']
    And request new_message
    When method PUT
    Then status 202
    And match response['@id'] == message['@id']
    And match response.content == new_message.content
    And match response.active == new_message.active

    # delete
    Given path 'flash-message', message['@id']
    When method Delete
    Then status 204

    # list
    Given path 'flash-message'
    When method GET
    Then status 200
    And assert response.length == length

Scenario: Wrong message

    Given path 'flash-message'
    And request { active: true }
    When method POST
    Then status 406

Scenario: Not Found

    Given path 'flash-message', '00000000-0000-0000-0000-000000000000'
    When method GET
    Then status 404

    Given path 'flash-message', '00000000-0000-0000-0000-000000000000'
    When method Delete
    Then status 404

    Given path 'flash-message', '00000000-0000-0000-0000-000000000000'
    And request { }
    When method PUT
    Then status 404

Scenario: Bad Request

    Given path 'flash-message', 'doudou'
    When method GET
    Then status 400

    Given path 'flash-message', 'doudou'
    When method Delete
    Then status 400

    Given path 'flash-message', 'doudou'
    And request { }
    When method PUT
    Then status 400
