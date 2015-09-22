Feature: Hear Shout

  Users can hear shouts from people nearby

  Rules:
  - Shout range is 1000m
  - Network connectivity required
  - Messages don't have signatures for now

  Questions:
  - How do we represent the network connectivity rule? This is the server!
  - Should we hear ourself? Can that actually be used as confirmation?

  Background:
    Given the following locations:
      | location_name       | lat        | lon        |
      | Osterley Station    | 51.4765056 | -0.3557913 |
      | Islesworth Station  | 51.4769982 | -0.3515469 |
      | Heathrow Terminal 5 | 51.4715394 | -0.4877838 |

  Scenario: Tom doesn't hear Jim's message
    Given "Jim" is in "Osterley Station"
    But "Tom" is in "Heathrow Terminal 5"
    When "Jim" shouts "hello"
    Then "Tom" should not receive the message

  Scenario: Lauren hears Claire's message
    Given "Claire" is in "Osterley Station"
    And "Lauren" is in "Islesworth Station"
    When "Claire" shouts "hi"
    Then "Lauren" should receive the message

  @smoke
  Scenario: Jim doesn't hear his own message
    Given "Jim" is in any location
    When "Jim" shouts "hello"
    Then "Jim" should not receive the message
