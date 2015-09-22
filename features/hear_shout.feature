Feature: Hear Shout

  Rules:
  - Message can only be received within 1 km
  - Shouter and listener's location must be known
  - Shouter's identity must be known
  - Display most recent message on top

  Questions:
  - Is there a limit on number of messages to be received?
  - Will I hear my neighbour's message from this morning when I get home?
  - Do received messages disappear when you move out of range?
  - How long does a message last?

  Scenario: Gush is 8m away from Elliott and can hear him

  Scenario: Gush is too far away from Elliott to hear him
    Given Gush's location is more than 1km from Elliott
    When Elliott sends a message
    Then Gush shouldn't receive any messages
