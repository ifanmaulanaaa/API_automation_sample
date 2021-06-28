@test
Feature: users

  Background:
    * url baseUrl

  Scenario: Verify type data
    Given path '/posts'
    When method GET
    Then status 200
    And match response contains {"userId": '#number', "id": '#number', "title": '#string', "body": '#string'}
    And print 'response---', response

  Scenario Outline: Compare equal response
    Given path '/posts'
    When request
    """
      {
      "title": '<title>',
      "body": '<body>',
      "userId": '<userId>',
      }
    """
    And method POST
    Then status 201
    And print 'response---', response
    And match response.title contains '#(title)'
    And match response.body contains '#(body)'
    And match response.userId contains '#(userId)'
    Examples:
      | title          | body        |  userId    |
      | recommendation | motorcycle  |     12     |
      | favorite       | plane       |     56     |
      | best seller    | car         |     32     |