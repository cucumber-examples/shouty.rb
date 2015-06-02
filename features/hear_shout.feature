Feature: Hear Shout

  Users can hear shouts from people nearby

  Rules:
  - Shout range is 1000m
  - Network connectivity required
  - Messages don't have signatures for now

  Questions:
  - How do we represent the network connectivity rule? This is the server!

  Scenario: Tom doesn't hear Jim's message
    Given "Jim" is in "Leeds Stadium"
    And "Tom" is in "Westminster Abbey"
    When "Jim" sends a message
    Then "Tom" should not receive the message

  Scenario: Lauren hears Claire's message
    Given "Claire" is in "Osterley Tube"
    And "Lauren" is in "Osterley Tube"
    When "Claire" sends a message
    Then "Lauren" should receive the message
