@api-program-mgmt @epic:program-management @feature:program-crud
Feature: Program Management API

  @smoke @positive @severity:critical @auth
  Scenario: List programs
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 200

  @positive @severity:high @auth
  Scenario: List Realtime programs
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set query param realtimeEnabled to true
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 200

  @positive @severity:high @auth
  Scenario: Create a program
    Given I make a POST request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "programSummary": {
          "name": "MR Test 818 pin 10",
          "startDate": "2025-10-01T00:00:00.000Z",
          "localStartTimezone": "UTC",
          "localEndTimezone": "UTC",
          "endDate": "2025-12-29T00:00:00.000Z",
          "country": "US",
          "ownerGroup": "SEC-IDM-CODES-MG_USMKT1",
          "desc": "test new program desc"
        },
        "codeDescriptor": {
          "profanityCheckEnabled": false,
          "length": 16,
          "prefix": "",
          "maxCount": 100000,
          "luhnsChecksumEnabled": false,
          "pointValue": 0,
          "characterSet": {
            "numbers": [
              { "code": "0", "synonym": "" },
              { "code": "1", "synonym": "" },
              { "code": "2", "synonym": "" },
              { "code": "3", "synonym": "" },
              { "code": "4", "synonym": "" },
              { "code": "5", "synonym": "" },
              { "code": "6", "synonym": "" },
              { "code": "7", "synonym": "" },
              { "code": "8", "synonym": "" },
              { "code": "9", "synonym": ""
              }
            ],
            "upperCaseAlphabets": [
              { "code": "A", "synonym": "" },
              { "code": "B", "synonym": "" },
              { "code": "C", "synonym": "" },
              { "code": "D", "synonym": "" },
              { "code": "E", "synonym": "" },
              { "code": "F", "synonym": "" },
              { "code": "G", "synonym": "" },
              { "code": "H", "synonym": "" },
              { "code": "I", "synonym": "" },
              { "code": "J", "synonym": "" },
              { "code": "K", "synonym": "" },
              { "code": "L", "synonym": "" },
              { "code": "M", "synonym": "" },
              { "code": "N", "synonym": "" },
              { "code": "O", "synonym": "" },
              { "code": "P", "synonym": "" },
              { "code": "Q", "synonym": "" },
              { "code": "R", "synonym": "" },
              { "code": "S", "synonym": "" },
              { "code": "T", "synonym": "" },
              { "code": "U", "synonym": "" },
              { "code": "V", "synonym": "" },
              { "code": "W", "synonym": "" },
              { "code": "X", "synonym": "" },
              { "code": "Y", "synonym": "" },
              { "code": "Z", "synonym": ""
              }
            ],
            "lowerCaseAlphabets": []
          }
        },
        "codeRedemptionRules": {
          "validAttemptsPeriodValue": 1,
          "inValidAttempts": 10,
          "inValidAttemptsPeriodValue": 10,
          "validAttempts": 25,
          "validAttemptsPeriod": "CALENDAR_DAY",
          "inValidAttemptsPeriod": "MINUTE",
          "blockAttemptsFor": 1,
          "blockAttemptsForPeriod": "MINUTE"
        }
      }
      """
    When I receive a response
    Then I expect response should have a status 201
    And I store response at id as pmProgramId

  @positive @severity:high @auth
  Scenario: Get program details by id
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}
    And I set path param programId to $S{pmProgramId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 200

  @positive @severity:high @auth
  Scenario: Update a program by id
    Given I make a PUT request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}
    And I set path param programId to $S{pmProgramId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "programSummary": {
          "name": "MR Test 101 pin 10",
          "startDate": "2025-10-01T00:00:00.000Z",
          "localStartTimezone": "UTC",
          "localEndTimezone": "UTC",
          "endDate": "2026-12-29T00:00:00.000Z",
          "country": "US",
          "ownerGroup": "SEC-IDM-CODES-MG_USMKT1",
          "desc": "Updated program desc"
        },
        "codeDescriptor": {
          "profanityCheckEnabled": false,
          "length": 16,
          "prefix": "",
          "maxCount": 100000,
          "luhnsChecksumEnabled": false,
          "pointValue": 0,
          "characterSet": {
            "numbers": [
              { "code": "0", "synonym": "" },
              { "code": "1", "synonym": "" },
              { "code": "2", "synonym": "" },
              { "code": "3", "synonym": "" },
              { "code": "4", "synonym": "" },
              { "code": "5", "synonym": "" },
              { "code": "6", "synonym": "" },
              { "code": "7", "synonym": "" },
              { "code": "8", "synonym": "" },
              { "code": "9", "synonym": ""
              }
            ],
            "upperCaseAlphabets": [
              { "code": "A", "synonym": "" },
              { "code": "B", "synonym": "" },
              { "code": "C", "synonym": "" },
              { "code": "D", "synonym": "" },
              { "code": "E", "synonym": "" },
              { "code": "F", "synonym": "" },
              { "code": "G", "synonym": "" },
              { "code": "H", "synonym": "" },
              { "code": "I", "synonym": "" },
              { "code": "J", "synonym": "" },
              { "code": "K", "synonym": "" },
              { "code": "L", "synonym": "" },
              { "code": "M", "synonym": "" },
              { "code": "N", "synonym": "" },
              { "code": "O", "synonym": "" },
              { "code": "P", "synonym": "" },
              { "code": "Q", "synonym": "" },
              { "code": "R", "synonym": "" },
              { "code": "S", "synonym": "" },
              { "code": "T", "synonym": "" },
              { "code": "U", "synonym": "" },
              { "code": "V", "synonym": "" },
              { "code": "W", "synonym": "" },
              { "code": "X", "synonym": "" },
              { "code": "Y", "synonym": "" },
              { "code": "Z", "synonym": ""
              }
            ],
            "lowerCaseAlphabets": []
          }
        },
        "codeRedemptionRules": {
          "validAttemptsPeriodValue": 1,
          "inValidAttempts": 10,
          "inValidAttemptsPeriodValue": 10,
          "validAttempts": 25,
          "validAttemptsPeriod": "CALENDAR_DAY",
          "inValidAttemptsPeriod": "MINUTE",
          "blockAttemptsFor": 1,
          "blockAttemptsForPeriod": "MINUTE"
        }
      }
      """
    When I receive a response
    Then I expect response should have a status 200

  @positive @severity:high @auth
  Scenario: Create a promotion under program
    Given I make a POST request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}/promotions
    And I set path param programId to $S{pmProgramId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "name": "Promo 818 9",
        "desc": "testdesc",
        "startDate": "2025-10-01T17:32:28Z",
        "endDate": "2026-07-21T17:32:28Z",
        "localStartTimezone": "Etc/UTC",
        "localEndTimezone": "UTC"
      }
      """
    When I receive a response
    Then I expect response should have a status 201
    And I store response at id as pmPromotionId

  @positive @severity:high @auth
  Scenario: List promotions
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/promotions
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 200

  @positive @severity:high @auth
  Scenario: List promotion by Program ID
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}/promotions/{promotionId}
    And I set path param programId to $S{pmProgramId}
    And I set path param promotionId to $S{pmPromotionId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 200

  @positive @severity:high @auth
  Scenario: Update promotion by Program ID
    Given I make a PUT request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}/promotions/{promotionId}
    And I set path param programId to $S{pmProgramId}
    And I set path param promotionId to $S{pmPromotionId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "name": "Promo 818 10",
        "description": "updated description",
        "startDate": "2025-10-01T17:32:28Z",
        "endDate": "2027-07-21T23:59:00Z"
      }
      """
    When I receive a response
    Then I expect response should have a status 200

  @negative @security @severity:critical @auth
  Scenario: Unauthorized request to list programs
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    When I receive a response
    Then I expect response should have a status 401

  @negative @severity:high @validation
  Scenario: Create program with invalid body
    Given I make a POST request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "programSummary": {},
        "codeDescriptor": {},
        "codeRedemptionRules": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 400

  @negative @severity:high @validation
  Scenario: Get program with invalid id
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}
    And I set path param programId to invalid-id
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 404

  @negative @severity:high @validation
  Scenario: Create promotion with missing fields
    Given I make a POST request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs/{programId}/promotions
    And I set path param programId to invalid-id
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {}
      """
    When I receive a response
    Then I expect response should have a status 400
  # Extended Authentication and Authorization Negative Tests

  @negative @security @severity:high @auth
  Scenario: List programs with expired bearer token
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer expired.jwt.token
    When I receive a response
    Then I expect response should have a status 401

  @negative @security @severity:high @auth
  Scenario: List programs with malformed bearer token
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer invalid-token-format
    When I receive a response
    Then I expect response should have a status 401

  @negative @security @severity:high @auth
  Scenario: List programs with empty bearer token
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer
    When I receive a response
    Then I expect response should have a status 401

  @negative @security @severity:high @auth
  Scenario: List programs with Basic Auth instead of Bearer
    Given I make a GET request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set basic authentication credentials testuser and testpass
    When I receive a response
    Then I expect response should have a status 401
  # HTTP Method and Protocol Negative Tests

  @negative @severity:medium @validation
  Scenario: Use wrong HTTP method DELETE on programs list endpoint
    Given I make a DELETE request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 405

  @negative @severity:medium @validation
  Scenario: Use wrong HTTP method PUT on programs list endpoint
    Given I make a PUT request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 405
