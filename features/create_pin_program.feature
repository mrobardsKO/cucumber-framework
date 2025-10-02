Feature: Create a Pincode Program

  Scenario: Create a program
    Given I make a POST request to $E{PACTUM_REQUEST_PROGRAM_MGMT_URL}/v2/programs
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "programSummary": {
          "name": "MR Test EME pin 1",
          "startDate": "2025-10-02T00:00:00.000Z",
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
              { "code": "9", "synonym": "" }
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
              { "code": "Z", "synonym": "" }
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
    And I expect response should have a json schema
      """
      {
        "type": "object",
        "properties": { "id": { "type": "string" } }
      }
      """
    And I store response at id as programId

  Scenario: Create a release using the programId
    Given I make a POST request to $E{PACTUM_REQUEST_RELEASE_MGMT_URL}/v2/programs/{programId}/releases
    And I set path param programId to $S{programId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to
      """
      {
        "name": "Release 1",
        "startDate": "2025-10-02T00:00:00.000Z",
        "endDate": "2025-11-30T00:00:00.000Z",
        "localActivateTimezone": "UTC",
        "localInactivateTimezone": "UTC",
        "realtimeCodesEnabled": false
      } 
      """
    When I receive a response
    Then I expect response should have a status 201
    And I expect response should have a json schema
      """
      {
        "type": "object",
        "properties": { "id": { "type": "string" } }
      }
      """
    And I store response at id as releaseId

  Scenario: Create a lot using the releaseId
    Given I make a POST request to $E{PACTUM_REQUEST_RELEASE_MGMT_URL}/v2/programs/{programId}/releases/{releaseId}/lots
    And I set path param programId to $S{programId}
    And I set path param releaseId to $S{releaseId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to:
      """
      {
        "name": "Lot1",
        "pointType": "",
        "promotion": "None",
        "pointValue": 500,
        "codesAlloted": 2000,
        "product": {
          "secondaryPackageId": "",
          "primaryContainerId": "",
          "brandName": "",
          "closureColorId": "",
          "beverageName": "",
          "closureTypeName": "",
          "closureTypeId": "",
          "closureDiameterId": "",
          "closureDiameterName": "",
          "closureColorName": "",
          "secondaryPackageName": "",
          "primaryContainerName": "",
          "trademarkId": "",
          "beverageId": "",
          "brandId": "",
          "trademarkName": ""
        },
        "codeRedemptionRules": {
          "validAttempts": "",
          "validAttemptsPeriod": "",
          "validAttemptsPeriodValue": ""
        }
      }
      """
    When I receive a response
    Then I expect response should have a status 201
    And I expect response should have a json schema
      """
      {
        "type": "object",
        "properties": { "id": { "type": "string" } }
      }
      """
    And I store response at id as lotId

  Scenario: Create a batch using the lotId
    Given I make a POST request to $E{PACTUM_REQUEST_RELEASE_MGMT_URL}/v2/programs/{programId}/releases/{releaseId}/batches
    And I set path param programId to $S{programId}
    And I set path param releaseId to $S{releaseId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    And I set body to:
      """
      {
        "name": "test",
        "receipientOrg": "157210",
        "codesPerFile": 0,
        "batchItems": [
          {
            "lotId": "$S{lotId}",
            "pointValue": 500,
            "noOfCodes": 2000
          }
        ]
      }
      """
    When I receive a response
    Then I expect response should have a status 201
    And I expect response should have a json schema
      """
      {
        "type": "object",
        "properties": { "id": { "type": "string" } }
      }
      """
    And I store response at id as batchId

  Scenario: Generate codes using the releaseId
    Given I make a POST request to $E{PACTUM_REQUEST_CODE_GEN_BATCH_URL}/v2/codegen/releases/{releaseId}/batch-jobs
    And I set path param releaseId to $S{releaseId}
    And I set header Authorization to Bearer $E{PACTUM_REQUEST_TOKEN}
    When I receive a response
    Then I expect response should have a status 200
