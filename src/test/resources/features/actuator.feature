Feature: Test actuator entrypoints

Background:
* url 'http://localhost:8080'

Scenario: Infos

    Given path 'actuator', 'info'
    When method GET
    Then status 200
    And match response.java == '#object'
    And match response.java ==
    """
    {
        version: '#string',
        specification: '#object',
        vm: '#object',
        home: '#string'
    }
    """
    And match response.os == '#object'
    And match response.os ==
    """
    {
        arch: '#string',
        name: '#string',
        version: '#string'
    }
    """

Scenario: Health

    Given path 'actuator', 'health'
    When method GET
    Then status 200
    And match response.status == 'UP'
    And match response.details == '#object'
