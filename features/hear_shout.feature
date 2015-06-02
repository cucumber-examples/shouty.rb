Feature: Hear Shout

  Users can hear shouts from people nearby

  Rules:
  -
  -

  Questions:
  -
  -

  Scenario: Tom doesn't hear Jim's message
    Given "Jim" is in "Leeds Stadium"
    And "Tom" is in "Westminster"
    When "Jim" sends a message
    Then "Tom" should not receive the message

  Scenario: Lauren hears Claire's message
    Given "Claire" is in "Osterly"
    And "Lauren" is also in "Osterly"
    When "Claire" sends a message
    Then "Lauren" should receive the message
